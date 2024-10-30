# MyFeatness!
![myFeatness](https://github.com/user-attachments/assets/6f667f88-08ae-4861-8f1d-5503a7fdc124)

![GitHub last commit](https://img.shields.io/github/last-commit/Vini-Coding/myFeatness)  
O MyFeatness é a sua feat para o mundo fitness. Com ele você descobre quantas calorias deve ingerir por dia através do cálculo da TMX - Taxa Metabólica Basal, auxiliando assim na elaboração de dietas para uma vida mais fitness e saudável.

![WhatsApp-Video-2024-10-30-at-15 26 02](https://github.com/user-attachments/assets/679b4360-4369-4f46-ab63-25cd62e3d924)
![WhatsApp-Video-2024-10-30-at-15 27 20](https://github.com/user-attachments/assets/557ca9b8-0360-4358-a463-80b1f487fec6)

![WhatsApp-Video-2024-10-30-at-15 28 11](https://github.com/user-attachments/assets/bb460c0a-af0e-4c3b-ac14-9d35ad83192c)
![WhatsApp-Video-2024-10-30-at-15 28 49](https://github.com/user-attachments/assets/549b6c82-a5ad-4267-bf46-be405e025122)

## Features
- Cálculo da Taxa Metabólica Basal.
- Validação de formulário.
- Listagem de artigos via API.
- Armazenamento local de seu resultado.
- Responsividade para celular, tablet, desktop, web, etc.
Confira os vídeos de demonstração do aplicativo aqui: [VER VÍDEOS DE DEMONSTRAÇÃO](https://drive.google.com/drive/folders/181KmLtok-vApkKUT_3qtXYIGJYmDrFEq?usp=sharing)

## Como utilizar
- Você pode utilizar o aplicativo baixando o apk: [Baixar APK](https://drive.google.com/drive/folders/17zPINbk5m5cNdKBvhviuVDtNFjAtp-4r)
- Ou acessando o website: [ACESSE O SITE](https://vini-coding.github.io/myfeatness-web/)
Para utilizar o aplicativo no modo debug siga os seguintes passos:
1. Para usar essa aplicação, primeiro você deve clonar esse repositório. Você pode clonar com a seguinte linha de comando:
```
git clone https://github.com/Vini-Coding/myFeatness
```
2. Segundamente, você pode abrir o projeto em seu editor de códigos.
3. E então, rodar o aplicativo com seguinte comando:
```
flutter run lib/main.dart
```

## Design da UI
No início do desenvolvimento como de costume, elaborei o design da interface utilizando o Figma para manter a coerência visual entre as telas 
![image](https://github.com/user-attachments/assets/aeee9087-34e2-4cd0-a0c6-b9ed97d23ac1)

## Desenvolvimento
### No desenvolvimento busquei simplicidade e praticidade.
- Utilizei ChangeNotifier e ValueNotifier para gerenciamento de estado.
- Utilizei provider para injeção de dependências.
- Utilizei arquitetura MVC com padrão repository.
- Utilizei rotas nomeadas do Material3 para navegação.
- Utilizei HIVE para armazenamento local dos dados.
- Utilizei o package 'introduction_screens' para as telas de onboarding.
### Na estrutura de arquivos
![image](https://github.com/user-attachments/assets/17c0cebd-d319-425b-ab79-d43d61ba636b)
Dividi o aplicativo entre o core e as features, com o core mantendo arquivos, utilitários e componentes mais gerais. De feature principal temos a Home que possui:
- Provider para formulário e salvamento de dados, provider para requisição e leitura de dados.
- UI responsiva com uma page para mobile, tablet e desktop.
- Arquivos de modelo para usuário e artigo.
- Repository para requisição da lista de artigos.
### Regra de negócios
- Desenvolvi um modelo "UserProfile()" que armazena informações do usuário como peso, altura, idade, sexo, frequência, objetivo e resultado da TMB. Na medida que o usuário vai preenchendo o formulário, um objeto vai sendo preenchido no provider de formulário, ao clicar em 'CALCULAR', o cálculo é feito e o resultado armazenado no objeto, que é salvo em um box do hive em seguida. 
- Então, o provider de leitura, requisita o objeto salvo no Hive para exibir, assim como também requisita a lista de artigos. 
- O cálculo da TMB é feito da seguinte forma:
**Cálculo de Calorias Diárias:**
- TMB (homens) = 88,362 + (13,397 x peso em kg) + (4,799 x altura em cm) - (5,677 x idade
em anos).
- TMB (mulheres) = 447,593 + (9,247 x peso em kg) + (3,098 x altura em cm) - (4,330 x
idade em anos)
2. Fator de Atividade Física:
Para calcular as calorias diárias totais, a TMB é multiplicada por um fator que representa o
nível de atividade física do usuário:
- Sedentário: TMB × 1.2
- Levemente ativo: TMB × 1.375
- Moderadamente ativo: TMB × 1.55
- Muito ativo: TMB × 1.725
- Calorias para Ganho ou Perda de Peso:
Com base no objetivo do usuário, o cálculo das calorias diárias é ajustado:
- Perda de peso: reduzir 20% das calorias diárias totais.
- Ganho de peso: aumentar 15% das calorias diárias totais.

## Próximos Passos
- Tematização do aplicativo utilizando Material3
- Investigação de carregamento das imagens de API dos artigos em acessos web.
- Histórico de resultados
- Rodapé para versão web
- Refatoração

## Links importantes
-  [Clique aqui para baixar o APK](https://drive.google.com/drive/folders/17zPINbk5m5cNdKBvhviuVDtNFjAtp-4r)
-  [Clique aqui para acessar o website](https://vini-coding.github.io/myfeatness-web/)
-  [Clique aqui para acessar o website](https://drive.google.com/drive/folders/181KmLtok-vApkKUT_3qtXYIGJYmDrFEq?usp=sharing)

