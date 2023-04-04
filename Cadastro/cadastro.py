import cv2  
import time
from firebase_admin import credentials, initialize_app, storage, firestore 
import os 
import pyrebase
import face_recognition

#configs
config = {
    "apiKey": "AIzaSyBfUkVDBCibf23ZyeVxB_8UYnDlhVularg",
    "authDomain": "porteiroeletronico-sel0373.firebaseapp.com",
    "databaseURL" : "gs://porteiroeletronico-sel0373.appspot.com/",
    "projectId": "porteiroeletronico-sel0373",
    "storageBucket": "porteiroeletronico-sel0373.appspot.com",
    "messagingSenderId": "209716118926",
    "appId": "1:209716118926:web:1311b757a0c27ed3c590df",
    "serviceAccount": "key.json"
  }

# Init firebase with your credentials
cred = credentials.Certificate("key.json")     #tem que baixar a chave e deixar na mesma pasta do arquivo ou então mudar o caminho
initialize_app(cred, {'storageBucket': 'porteiroeletronico-sel0373.appspot.com'})   #inicializa no nosso banco de dados
db = firestore.client()

#talvez dê conflitos
firebase = pyrebase.initialize_app(config)
storage = firebase.storage()

def ler_token():

    comando_ref = db.collection(u'Token').document(u'token')
    comando_dict = comando_ref.get().to_dict()
    token = comando_dict['token']
    nome = comando_dict['nome']

    if token == 1:
        cadastro(nome)
    
    if token == 2:
        remover(nome)

    db.collection(u'Token').document('token').set({u'name': "" , u'token': 0})

    return

def captura_imagem(token, name): #capturar a imagem
    vid = cv2.VideoCapture(0)     
    time.sleep(1)
    _, imagem = vid.read()
    vid.release()

    if token == 1:               #se token = 1 -> cadastro de usuário
        file_name = f"{name}.jpg"
    else:
        file_name = "video.jpg"  #se tokem != ! -> ta enviando uma imagem do video

    cv2.imwrite(file_name, imagem)
    return 

def upload_and_get_url(fileName): #passa um arquivo e faz upload
    bucket = storage.bucket()
    blob = bucket.blob(fileName) #cria o blob com o nome do arquivo
    blob.upload_from_filename(fileName) # faz o upload da imagem a partir do filename dela
    blob.make_public() #torna a imagem publica
    return blob.public_url #retorna a url

def cadastro(name): #função de cadastro
    image_name = f"{name}.jpg" #formata o nome da imagem que vai ser enviada pro storage
    captura_imagem(1, name) #tira a foto da imagem, com token = 1 e com o nome passado
    url = upload_and_get_url(image_name) #pega a url a partir da função feita pra isso
    os.remove(image_name) #remover a imagem que foi salva
    db.collection(u'cadastros').document(name).set({u'name': name , u'foto': url}) #.add() é sem id
    return print("cadastro concluido com sucesso")

def real_time_image(): #função para ficar capturando a imagem e ficar enviando para a coleção "video" que será mostrada no site
    image_name = "video.jpg"   
    remover(image_name)
    imagem = captura_imagem(2,"") #usa a função captura a imagem
    url = upload_and_get_url(image_name) #usa a função de guardar a imagem e obter a url
    os.remove(image_name) #remover a imagem que foi salva
    db.collection(u'video').document(u'imagem').set({u'name': "video" , u'foto': url}) #joga a imagem na coleação
    return

def remover(name): #remover do storage e do firestore, o nome da pessoa é passado e o arquivo é removido
    db.collection(u"cadastros").document(name).delete() #remove o elemento da coleção -> documento (nome dado)
    bucket = storage.bucket()
    blob = bucket.blob(name + ".jpg") #passa o nome da imagem pro bucket
    blob.delete() #remove o blob com o nome da imagem
    return print("cadastro e imagem removidas com sucesso")

def download_images(): #função para baixar as imagens do storage
    files = storage.list_files() #pega o nome das imagens no storage
    os.mkdir("images") #cria uma fold pra armazenar as imagens
    for file in files:
        storage.child(file.name).download(file.name,f"images/{file.name}")
    os.remove("images/video.jpg")


#precis testar e avaliar as 2 funções a seguir ----------------
def known_face_encodings(directory):
    encodings = {}
    for filename in os.listdir(directory):
        if filename.endswith('.jpg') or filename.endswith('.png'):
            image_path = os.path.join(directory, filename)
            image = face_recognition.load_image_file(image_path)
            encodings[filename.split('.')[0]] = face_recognition.face_encodings(image)[0]
    return encodings

def reconhecimento():
    image = face_recognition.load_image_file("teste.jpg")
    face_locations = face_recognition.face_locations(image) 
    face_encodings = face_recognition.face_encodings(image, face_locations)

    encodings = known_face_encodings("images")

    # Comparar cada rosto encontrado com os rostos conhecidos
    for face_encoding in face_encodings:
        matches = face_recognition.compare_faces(list(encodings.values()), face_encoding)
    
        # Procurar entre as faces conhecidas para ver se alguma é uma correspondência
        if True in matches:
            matched_index = matches.index(True)
            name = list(encodings.keys())[matched_index]
            return name
    return "Desconhecido"

real_time_image()

##########LINKS UTEIS##############
#https://firebase.google.com/s/results/?q=db%20collection
#https://firebase.google.com/docs/firestore/query-data/listen?hl=pt-br
#https://firebase.google.com/docs/firestore/manage-data/add-data?hl=pt-br
