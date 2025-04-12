# Projeto de Análise de Locação de Filmes

Esse projeto foi desenvolvido para a empresa fictícia **MovieStream Analytics**, com o objetivo de construir uma solução de análise de dados robusta e escalável, voltada para o mercado de locação e streaming de filmes. A ideia é explorar, processar e apresentar insights estratégicos de forma eficiente e acessível, utilizando ferramentas como PostgreSQL, DBT, Power BI e Airflow.

## Arquitetura da Solução

Para construir a solução, foi necessário integrar diversas tecnologias que se comunicam de forma orquestrada. A arquitetura adotada é composta por:

1. **PostgreSQL**: A base de dados foi configurada no PostgreSQL, armazenando todas as informações sobre locações, filmes, clientes, pagamentos e categorias. 
2. **DBT (Data Build Tool)**: Utilizamos o DBT para modelar e transformar os dados no banco de dados. Com o DBT, criamos modelos analíticos e tabelas que foram estruturadas para responder às perguntas de negócio.
3. **Airflow**: Para orquestrar o fluxo de dados, o Airflow foi utilizado para agendar e executar as transformações automaticamente. O objetivo aqui é garantir que os dados sejam atualizados e processados periodicamente.
4. **Power BI**: Após as transformações de dados, o Power BI foi escolhido para criar painéis interativos que apresentam os resultados de forma visual e intuitiva.

## Estratégia de CDC (Change Data Capture)

A estratégia de **CDC** foi aplicada para garantir que as transformações nos dados fossem realizadas de maneira eficiente e atualizada. As tabelas de maior volume de dados, como `rental` e `payment`, foram configuradas com regras específicas para capturar e processar mudanças, garantindo que as análises estivessem sempre refletindo os dados mais recentes.

Isso significa que a solução está sempre atualizada, refletindo as mudanças mais recentes de maneira automática e sem intervenção manual, algo crucial para fornecer insights frescos e precisos.

## Cronograma de Execução das DAGs no Airflow

As tarefas de ingestão e transformação de dados são agendadas para execução regular, utilizando o Airflow. Isso garante que o processo de ETL (Extração, Transformação e Carga) seja feito em intervalos definidos, com a periodicidade ideal para o negócio. As DAGs estão configuradas para rodar automaticamente, sem a necessidade de monitoramento constante.

## Estratégia de Versionamento e Testes no DBT

O DBT foi utilizado com práticas sólidas de versionamento, o que permite garantir que as transformações no banco de dados sejam rastreáveis e eficientes. Além disso, testes de qualidade de dados foram configurados para verificar consistência, integridade e confiabilidade, garantindo que os dados entregues ao Power BI sejam sempre precisos e corretos.

## Modelos DBT Criados

Foram criados três principais modelos analíticos para gerar insights de negócio:

1. **mart_customer_lifetime_value**: Este modelo calcula o valor total gasto por cliente ao longo do tempo e o tempo desde sua primeira locação, ajudando a entender a fidelidade dos clientes.
2. **mart_film_popularity**: Esse modelo analisa os filmes mais alugados, agrupados por mês e ano, fornecendo um ranking atualizado de popularidade.
3. **mart_store_performance**: O objetivo desse modelo é avaliar a performance das lojas, considerando a quantidade de locações feitas e a receita gerada.

## Painel de Visualização no Power BI

Utilizamos o **Power BI** para criar visualizações interativas que ajudam na tomada de decisões. O painel inclui:

- **Receita por Categoria de Filme**: Para identificar quais categorias estão gerando mais receita.
- **Locações por Mês**: Um gráfico que mostra a quantidade de locações realizadas mensalmente.
- **Clientes Ativos**: Uma visão dos clientes que realizaram locações recentemente.

Essas visualizações oferecem uma visão clara e acessível sobre as métricas mais importantes para o negócio.

## Como Executar o Projeto

1. **Configuração do Banco de Dados**: Configure o PostgreSQL com as tabelas e dados fornecidos no link da base de dados.
2. **Configuração do DBT**: Instale o DBT, configure os modelos de transformação e conecte ao seu banco de dados PostgreSQL.
3. **Configuração do Airflow**: Instale o Airflow e configure as DAGs para orquestrar as execuções do DBT e garantir que os dados sejam atualizados.
4. **Configuração do Power BI**: Conecte o Power BI ao banco de dados e crie as visualizações conforme os modelos DBT transformados.

## Contato

Caso tenha dúvidas sobre o projeto ou queira mais informações, não hesite em entrar em contato:

- **Nome**: Gustavo Pimentel
- **E-mail**: gpimentel812@gmail.com
