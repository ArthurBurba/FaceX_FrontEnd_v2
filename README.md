# Guia de Configuração e Execução do QML no Python

Este documento explica quais dependências são necessárias no seu ambiente Python para rodar arquivos `.qml` e a estrutura de pastas correta onde os arquivos devem ser colocados.

---

## 1. Dependências do Python

Para que o Python consiga interpretar e renderizar a interface visual criada em QML, é necessário instalar os bindings do **Qt**. Você pode usar a biblioteca oficial (**PySide6**) ou a comunidade (**PyQt6**).

Execute um dos comandos abaixo no seu terminal para instalar as dependências necessárias:

### Opção A: PySide6 (Recomendado - Oficial da Qt)

```bash
pip install PySide6
```

### Opção B: PyQt6
```bash
pip install PyQt6
```
Nota: Certifique-se de estar usando o Python 3.8 ou superior e com o seu ambiente virtual (venv) ativado, caso utilize um.

## 2. Estrutura de Arquivos e Destino

Você não precisa copiar a estrutura de pastas e arquivos de configuração gerados automaticamente pelo Qt Design Studio (como arquivos .qmlproject, pastas de metadados, etc.).

Apenas o arquivo principal de interface (Screen01.qml) e os recursos diretamente utilizados por ele (como imagens ou fontes) devem ser movidos.

### Caminho de Destino

Coloque o seu arquivo QML na seguinte pasta:
```bash
Face-X-main\central\Screen01.qml
```
---
Face-X-main/  
└── central/  
    ├── interface.py           // Script Python que inicializa a aplicação  
    ├── Screen01.qml      // Arquivo principal do QML  
    └── ...           
---

## 3. Exemplo de script para inicialização do arquivo

Dentro da pasta Face-X-main\central\, o seu script Python (interface.py) deve carregar o arquivo Screen01.qml:
```bash
import sys
from PySide6.QtGui import QGuiApplication
from PySide6.QtQml import QQmlApplicationEngine

# 1. Inicializa a aplicação Qt
app = QGuiApplication(sys.argv)

# 2. Cria o motor de QML
engine = QQmlApplicationEngine()

# 3. Carrega o arquivo QML principal
engine.load("Screen01.qml")

# 4. Verifica se o arquivo foi carregado com sucesso
if not engine.rootObjects():
    sys.exit(-1)

# 5. Executa o loop principal
sys.exit(app.exec())
```
    
