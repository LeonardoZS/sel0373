from firebase_admin import credentials, initialize_app, storage, firestore

# Init firebase with your credentials
cred = credentials.Certificate("key.json")
initialize_app(cred, {'storageBucket': 'porteiroeletronico-sel0373.appspot.com'})
db = firestore.client()
collection = db.collection('places')

name = "maciel" #aqui tem que puxar o módulo de pegar o nome de quem vai ser cadastrado
image = "maciel.jpg" #aqui tem que chamar o módulo de tirar a foto da pessoa ou algo do tipo

def upload_and_get_url(fileName): #pass a file and upload to storage and get the url
    bucket = storage.bucket()
    blob = bucket.blob(fileName)
    blob.upload_from_filename(fileName)
    blob.make_public()
    return blob.public_url

def cadastro(image, name):
    url = upload_and_get_url(image)
    update_time, city_ref = db.collection(u'cadastros').add({u'name': name , u'foto': url}) #.add() é sem id
    print("cadastro concluido com sucesso")

cadastro(image, name)
