import pandas as pd

# Carregar a base de dados
df = pd.read_csv('imdb_top_1000.csv')

# Selecionar e renomear as colunas necessárias
df = df[['Series_Title', 'Genre', 'Released_Year', 'Runtime', 'Director', 'Star1', 'IMDB_Rating']]
df = df.rename(columns={
    'Series_Title': 'nome',
    'Genre': 'genero',
    'Released_Year': 'ano',
    'Runtime': 'duracao',
    'Director': 'diretor',
    'Star1': 'ator',
    'IMDB_Rating': 'nota_imdb',
})

# Limpar e formatar as colunas
df['genero'] = df['genero'].str.split(',').str[0].str.lower()
df['duracao'] = df['duracao'].str.replace(' min', '').astype(int)

# Ordenar pelo campo 'nota_imdb'
df = df.sort_values(by='nota_imdb', ascending=False)

# Função para escapar aspas simples e formatar a saída
def escape_single_quotes(text):
    if isinstance(text, str):
        return text.replace("'", "''")
    return text

# Função para criar a saída no formato desejado
def format_row(row):
    nome = escape_single_quotes(row['nome'])
    genero = escape_single_quotes(row['genero'])
    diretor = escape_single_quotes(row['diretor'])
    ator = escape_single_quotes(row['ator'])
    return f"filme('{nome}', '{genero}', {row['ano']}, {row['duracao']}, '{diretor}', '{ator}', {row['nota_imdb']})."

# Aplicar a formatação a cada linha
formatted_rows = df.apply(format_row, axis=1)

# Salvar o resultado em um arquivo de texto
with open('basededados.txt', 'w') as f:
    for line in formatted_rows:
        f.write(line + '\n')

print("Arquivo 'basededados.txt' gerado com sucesso.")
