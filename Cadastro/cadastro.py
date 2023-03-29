import cv2
import time
from firebase_admin import credentials, initialize_app, storage, firestore

# Init firebase with your credentials
cred = credentials.Certificate("key.json")
initialize_app(cred, {'storageBucket': 'porteiroeletronico-sel0373.appspot.com'})
db = firestore.client()
collection = db.collection('places')

def captura_imagem(): #capturar a imagem
    vid = cv2.VideoCapture(0)     
    time.sleep(1)
    _, imagem = vid.read()
    vid.release()
    cv2.imwrite("teste.jpg", imagem)
    return 

def upload_and_get_url(fileName): #passa um arquivo e faz upload
    bucket = storage.bucket()
    blob = bucket.blob(fileName)
    blob.upload_from_filename(fileName)
    blob.make_public()
    return blob.public_url

def cadastro(): #função de cadastro
    captura_imagem()
    name = input("Digite o nome de cadastro:")
    image = "teste.jpg"
    url = upload_and_get_url(image)
    update_time, city_ref = db.collection(u'cadastros').add({u'name': name , u'foto': url}) #.add() é sem id
    return print("cadastro concluido com sucesso")

cadastro()
