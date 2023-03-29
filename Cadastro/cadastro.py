import cv2
import time
from firebase_admin import credentials, initialize_app, storage, firestore
import os

# Init firebase with your credentials
cred = credentials.Certificate("key.json")
initialize_app(cred, {'storageBucket': 'porteiroeletronico-sel0373.appspot.com'})
db = firestore.client()
collection = db.collection('places')

def captura_imagem(token): #capturar a imagem
    vid = cv2.VideoCapture(0)     
    time.sleep(1)
    _, imagem = vid.read()
    vid.release()

    if token == 1:
        file_name = "teste.jpg"
    else:
        file_name = "video.jpg"

    cv2.imwrite(file_name, imagem)
    return 

def upload_and_get_url(fileName): #passa um arquivo e faz upload
    bucket = storage.bucket()
    blob = bucket.blob(fileName)
    blob.upload_from_filename(fileName)
    blob.make_public()
    return blob.public_url

def cadastro(): #função de cadastro
    image_name = "teste.jpg"
    captura_imagem(1)
    name = input("Digite o nome de cadastro:")
    url = upload_and_get_url(image_name)
    os.remove(image_name)
    db.collection(u'cadastros').add({u'name': name , u'foto': url}) #.add() é sem id
    return print("cadastro concluido com sucesso")

def real_time_image(): #função para ficar capturando a imagem e ficar enviando para a coleção "video" que será mostrada no site
    image_name = "video.jpg"
    imagem = captura_imagem(2) #usa a função captura a imagem
    url = upload_and_get_url(image_name) #usa a função de guardar a imagem e obter a url
    os.remove(image_name)
    db.collection(u'video').document(u'imagem').set({u'name': "video" , u'foto': url}) #joga a imagem na coleação
    return

cadastro()

##########LINKS UTEIS##############
#https://firebase.google.com/s/results/?q=db%20collection
#https://firebase.google.com/docs/firestore/query-data/listen?hl=pt-br
#https://firebase.google.com/docs/firestore/manage-data/add-data?hl=pt-br
