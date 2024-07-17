import pandas as pd

# Carregar a base de dados
df = pd.read_csv('imdb_top_1000.csv')

# Selecionar e renomear as colunas necessárias
df = df[['Series_Title', 'Genre', 'Released_Year', 'Runtime', 'Director', 'Star1','IMDB_Rating']]
df = df.rename(columns={
    'Series_Title': 'nome',
    'Genre': 'genero',
    'Released_Year': 'ano',
    'Runtime': 'duracao',
    'Director': 'diretor',
    'Star1': 'ator',
    'IMDB_Rating': 'nota_imdb'
})

# Limpar e formatar as colunas
df['genero'] = df['genero'].str.split(',').str[0].str.lower()
df['duracao'] = df['duracao'].str.replace(' min', '').astype(int)

# Função para criar a saída no formato desejado
def format_row(row):
    return f"filme('{row['nome']}', '{row['genero']}', {row['ano']}, {row['duracao']}, '{row['diretor']}', '{row['ator']}')."

# Aplicar a formatação a cada linha
formatted_rows = df.apply(format_row, axis=1)

# Salvar o resultado em um arquivo de texto
with open('basededados.txt', 'w') as f:
    for line in formatted_rows:
        f.write(line + '\n')

print("Arquivo 'filmes_formatados.txt' gerado com sucesso.")
