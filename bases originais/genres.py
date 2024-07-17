import pandas as pd
import re

# Função para extrair dados do arquivo de texto
def extract_data_from_file(file_path):
    data = []
    with open(file_path, 'r') as file:
        for line in file:
            match = re.match(r"filme\('(.+)', '(.+)', (\d+), (\d+), '(.+)', '(.+)', ([\d.]+)\)\.", line)
            if match:
                data.append(match.groups())
    return data

# Extrair os dados do arquivo
data = extract_data_from_file('basededados.txt')

# Criar um DataFrame com os dados extraídos
columns = ['nome', 'genero', 'ano', 'duracao', 'diretor', 'ator', 'nota_imdb']
df = pd.DataFrame(data, columns=columns)

# Contar quantos gêneros existem e listar quais são
genero_count = df['genero'].value_counts()
genero_list = df['genero'].unique()

# Mostrar os resultados
print(f"Total de gêneros: {len(genero_list)}")
print("Gêneros:")
print(genero_list)

# Mostrar a contagem de cada gênero
print("\nContagem de cada gênero:")
print(genero_count)
