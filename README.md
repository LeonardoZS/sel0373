# AIOCK

Repositório referente ao projeto final da disciplina de **IoT (INTERNET OF THINGS) SEL0373** .

## PROJETO

O projeto realizado para para a disciplina foi um **porteiro eletrônico com reconhecimento facial**. Para tal, utilizou-se uma *Raspberry Pi 4* como *hardware* embarcado. Já para o sistema de interface de usuário, utilizou-se o *Flutter* para confecção do sistema WEB.

##APRESENTAÇÃO

Segue abaixo o link referente a apresentação que ilustra os equipamentos utilizados, implementações realizadas e o esquema de comunicação adotado.

[*Apresentação - IOT*](https://docs.google.com/presentation/d/1V8DTw_TA2eZbSbMBqUk4iPKVVDjOXhiXsLJS1iZbnnc/edit?pli=1)

##SITE

O site do projeto final pode ser acessado por do link abaixo

[*Site - versão final*](https://porteiroeletronico-sel0373.web.app/)

- Login: 
- Senha:

##RASPBERRY

- Pasta *Reconhecimento* contém todos os arquivos necessários;
- Requirements.txt disponível no repositório;
- Instalação da biblioteca face-recognition:[*raspberry pi*](https://gist.github.com/ageitgey/1ac8dbe8572f3f533df6269dab35df65);
- Manter key.json na mesma pasta que porteiro.py;
- Para executar o código: python3 ./forever.py porteiro.py --cpu -1

Instalação de todas as bibliotecas do firebase na *raspberry* pode dar problema, pois não há suporte oficial para esta plataforma.

##Observação

Ademais, vale ressaltar que por questões de segurança, alguns arquivos e credenciais envolvendo o firebase foram retirados quando o repositório se tornou publico. Isto foi feito para manter a integridade do projeto, a fim de evitar eventuais exposições de dados.Caso seja necessário, mande email para algum dos integrantes do grupo para a versão com as credenciais.

- leonardozaniboni@usp.br
- domingues.gabriel@usp.br
- brunopsant@usp.br

# Documentação

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)
- [Firebase Documentation](https://firebase.google.com/docs?hl=pt)
- [Face recognition](https://pypi.org/project/face-recognition/)
