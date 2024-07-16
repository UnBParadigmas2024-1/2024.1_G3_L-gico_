import csv

# Caminho para o arquivo CSV fornecido
input_file_path = '../base original/filmtv_movies.csv'
output_file_path = '../base original/filtered_movies.txt'

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
            directors = row['directors']
            actors = row['actors']
            
            # Escrever os valores em uma linha, separados por ";"
            txtfile.write(f'filme("{title}","{genre}",{year},{duration},"{country}","{directors}","{actors}").\n')

print("Arquivo criado com sucesso.")