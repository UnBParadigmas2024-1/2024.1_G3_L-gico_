import csv

# Caminho para o arquivo CSV fornecido
input_file_path = '../base original/filmtv_movies.csv'
output_file_path = '../base original/basededados.txt'

# Função para adicionar aspas duplas em torno de cada termo em uma lista
def add_quotes_and_format_list(list_string):
    terms = [term.strip() for term in list_string.split(',')]
    
    if len(terms) > 0:
        if len(terms) > 1:
            quoted_terms = [f'"{term}"' for term in terms]
            return f'[{", ".join(quoted_terms)}]'
        else:
            return f'"{terms[0]}"'
    else:
        return '"none"'

# Ler o arquivo CSV original
with open(input_file_path, 'r', newline='', encoding='utf-8') as csvfile:
    reader = csv.DictReader(csvfile)
    
    # Escrever os valores das colunas solicitadas em um novo arquivo
    with open(output_file_path, 'w', newline='', encoding='utf-8') as txtfile:
        for row in reader:
            title = row['title']
            genre = row['genre']
            year = row['year']
            duration = row['duration']
            country = row['country']
            directors = add_quotes_and_format_list(row['directors'])
            actors = add_quotes_and_format_list(row['actors'])
            
            # Escrever os valores em uma linha, separados por ";"
            txtfile.write(f'filme("{title}","{genre}",{year},{duration},"{country}",{directors},{actors}).\n')

print("Arquivo criado com sucesso.")
