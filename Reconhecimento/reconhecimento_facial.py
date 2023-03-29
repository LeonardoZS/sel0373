import face_recognition

def reconhecimento(foto_cadastro, foto_acesso):

    cadastro_encoding = face_recognition.face_encodings(foto_cadastro)[0]
    acesso_encoding = face_recognition.face_encodings(foto_acesso)[0]

    results = face_recognition.compare_faces([cadastro_encoding], acesso_encoding)

    return results
