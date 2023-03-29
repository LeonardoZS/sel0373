import cv2  
import time
from firebase_admin import credentials, initialize_app, storage, firestore 
import os 

# Init firebase with your credentials
cred = credentials.Certificate("Cadastro/key.json") #tem que baixar a chave e deixar na mesma pasta do arquivo ou então mudar o caminho
initialize_app(cred, {'storageBucket': 'porteiroeletronico-sel0373.appspot.com'}) #inicializa no nosso banco de dados
db = firestore.client()
#collection = db.collection('places') 

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

    if token == 1:                  #se token = 1 -> cadastro de usuário
        file_name = f"{name}.jpg"
    else:
        file_name = "video.jpg" # se tokem != ! -> ta enviando uma imagem do video

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

ler_token()

##########LINKS UTEIS##############
#https://firebase.google.com/s/results/?q=db%20collection
#https://firebase.google.com/docs/firestore/query-data/listen?hl=pt-br
#https://firebase.google.com/docs/firestore/manage-data/add-data?hl=pt-br
