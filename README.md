<div align="center">

# 🌱 GreenAlpha Portfolio: Otimização Financeira & Filtros ESG

[![Python](https://img.shields.io/badge/Python-3.10%2B-blue?style=for-the-badge&logo=python&logoColor=white)](https://www.python.org/)
[![Pandas](https://img.shields.io/badge/Pandas-Data_Analysis-150458?style=for-the-badge&logo=pandas&logoColor=white)](https://pandas.pydata.org/)
[![Power BI](https://img.shields.io/badge/Power_BI-Dashboard-F2C811?style=for-the-badge&logo=powerbi&logoColor=black)](https://powerbi.microsoft.com/)
[![SQLite](https://img.shields.io/badge/SQLite-Database-003B57?style=for-the-badge&logo=sqlite&logoColor=white)](https://www.sqlite.org/)

*Desafio Quantitativo & Sustentável — Verde Valores Asset Management*[cite: 1]

</div>

---

## 🎯 1. Visão Geral e Contexto do Projeto

Atuamos como **Analistas Quantitativos (Quants)** na *Verde Valores Asset Management* (gestora de R$ 4 bilhões baseada em São Paulo)[cite: 1]. 

Recebemos uma proposta institucional irrecusável: um fundo soberano dos países nórdicos quer realizar um aporte de **R$ 500 milhões**[cite: 1]. O mandato exige estritamente que a carteira apresente uma pegada de carbono auditada ($tCO_2e$ por milhão de receita líquida) **pelo menos 40% menor do que a média do Ibovespa**, sem evidências de *greenwashing*[cite: 1].

> **O Desafio:** Superar o ceticismo inicial do CIO — que temia uma perda drástica de rentabilidade ao cortar gigantes intensivos em carbono como Petrobras e Vale[cite: 1] — provando matematicamente a viabilidade da carteira **GreenAlpha ESG**[cite: 1].

---

## 📐 2. Fundamentação Matemática e Teórica

* **Teoria Moderna de Portfólio (Markowitz):** Otimização da relação risco-retorno utilizando a matriz de covariância dos ativos da B3[cite: 1].
* **Função Objetivo (Maximização de Sharpe):**
  $$\text{Sharpe} = \frac{R_p - R_f}{\sigma_p}$$
* **Restrição Ambiental (Convexa):**  
  $$\sum (\text{Peso}_i \times \text{Intensidade de Carbono}_i) \le \text{Teto Verde Permitido}$$
* **Simulação de Monte Carlo:** Geração de mais de **2.500 cenários de portfólios** em Python para mapear empiricamente a Fronteira Eficiente[cite: 1].

---

## 🛠️ 3. Stack Tecnológica

| Camada | Ferramentas & Tecnologias |
| :--- | :--- |
| **Linguagem & Matemática** | Python (`SciPy`, `yfinance`, `NumPy`, `Pandas`)[cite: 1] |
| **Banco de Dados** | SQL / SQLite (`fintech_esg.db`, Modelagem Star Schema com CTEs)[cite: 1] |
| **Visualização de Dados** | Power BI Desktop (`DAX`, Medidas Avançadas, *Scatters* e *What-If*)[cite: 1] |
| **Fontes de Dados** | Cotações diárias B3 via Yahoo Finance + Inventários oficiais GHG Protocol & B3 ICO2[cite: 1] |

---

## 📊 4. Principais Desafios e Resultados Técnicos

1. **Python (SciPy SLSQP):** Implementação bem-sucedida da otimização convexa restrita. A alocação deslocou capital de ativos poluentes para opções eco-eficientes (ex: WEG, CPFL, Itaú), entregando **25,92% a.a. de retorno** com volatilidade contida em **17,76%**[cite: 1].
2. **SQL (Eco-Eficiência):** Formulação de métricas de retorno financeiro por tonelada de carbono. A carteira GreenAlpha atingiu uma eco-eficiência de **1,30** (quase o dobro da tradicional, que registou 0,67)[cite: 1].
3. **Descarbonização Real:** O portfólio verde alcançou uma redução de **51,48%** nas emissões, superando com folga a meta regulatória de 40% estipulada pelo investidor europeu[cite: 1].
4. **Concentração de Emissões:** Consultas SQL comprovaram analiticamente que Petrobras e Vale concentram mais de 90% das emissões absolutas (Escopos 1, 2 e 3) do universo avaliado[cite: 1].

---

## 🖥️ 5. Arquitetura do Dashboard no Power BI

O painel de controlo foi desenhado sob preceitos rigorosos de UX/UI para apoiar o Comitê de Investimentos[cite: 1]:
* 🔹 **Tela 1 (Visão Executiva):** Cards de Retorno, Volatilidade e Sharpe + Gráficos comparativos de alocação de ativos[cite: 1].
* 🔹 **Tela 2 (Fronteira Eficiente ESG):** Gráfico de dispersão (*Scatter*) com 2.500 pontos de Monte Carlo coloridos por gradiente de intensidade de carbono[cite: 1].
* 🔹 **Tela 3 (Deep Dive GHG Protocol):** Matriz analítica detalhando individualmente os Escopos 1, 2 e 3 por companhia[cite: 1].
* 🔹 **Tela 4 (Simulador What-If):** Controlo interativo (*slider*) para simular tetos de carbono dinâmicos e recalcular o Índice de Sharpe em tempo real[cite: 1].

---

## 👥 6. Divisão de Tarefas para o Grupo

| Etapa / Módulo | Responsável Sugerido | Descrição da Entrega |
| :--- | :--- | :--- |
| **Modelagem Python & Otimização** | *Membro 1* | Scripts de recolha no Yahoo Finance, cálculo da Matriz de Covariância e otimização SLSQP com restrição de carbono[cite: 1]. |
| **Banco de Dados & Queries SQL** | *Membro 2* | Estruturação do Star Schema (`dim_empresa`, `fato_cotacoes`, etc.) e queries analíticas de eco-eficiência[cite: 1]. |
| **Dashboard Power BI & DAX** | *Membro 3* | Criação de medidas DAX, modelagem relacional, Fronteira Eficiente e simulador *What-If*[cite: 1]. |
| **Documentação & Apresentação (Pitch)** | *Membro 4* | Gestão deste `README.md`, estruturação da defesa no formato **STAR** e validação final da tese do fundo[cite: 1]. |

---

<div align="center">
  <i>Desenvolvido com 💚 para o Case GreenAlpha — 2026</i>
</div>
