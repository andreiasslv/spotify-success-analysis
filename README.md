# spotify-success-analysis

## 📄 Resumo do Projeto

Este projeto analisa um conjunto de dados do Spotify para identificar os principais fatores que levam uma música ao sucesso comercial, medido pelo número de streams. A análise parte de uma exploração ampla de várias hipóteses (como BPM, colaborações e popularidade multicanal) e aprofunda-se no fator mais impactante — a inclusão em playlists — para quantificar seu efeito através de um modelo de regressão linear.

O objetivo final é fornecer à indústria musical insights acionáveis para otimizar estratégias de lançamento.

---

## 🛠️ Ferramentas e Tecnologias

*   **Processamento e Armazenamento de Dados:** Google BigQuery (SQL)
*   **Análise Preditiva:** Python (Pandas, Scikit-learn) em ambiente Google Colab
*   **Visualização de Dados e Dashboard:** Microsoft Power BI

---

## 📈 Resultados e Insights Chave

Nossa análise revelou quatro conclusões principais:

1.  **Obsessão por Playlists:** A inclusão em playlists é o fator preditivo mais forte para o sucesso. Nosso modelo estima que **cada playlist adicional gera, em média, 56.761 streams**.
2.  **O Poder das Colaborações:** Músicas com dois ou mais artistas têm uma média de streams significativamente maior do que as de artistas solo.
3.  **Mitos Refutados:** Fatores como o BPM (batidas por minuto) da música não apresentaram correlação clara com o sucesso.
4.  **Sucesso é um Indicador, não uma Garantia:** Existe uma correlação positiva (≈0.7) entre o sucesso no Spotify e em outras plataformas, mas ela não é absoluta, exigindo monitoramento independente.

---

## 📁 Estrutura do Repositório

*   **/queries:** Contém as consultas SQL utilizadas para limpeza, transformação e análise dos dados no BigQuery.
*   **/analysis:** Inclui o notebook Python (`.ipynb`) com a análise de regressão linear.
*   **/dashboard:** Contém o arquivo fonte do Power BI (`.pbix`).
*   **README.md:** Este documento.

---

*   [Andreia S,](https://www.linkedin.com/in/andreiasslv/)
