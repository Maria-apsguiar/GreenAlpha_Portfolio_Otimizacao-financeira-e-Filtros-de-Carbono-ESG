<div align="center">

# 🌿 GreenAlpha ESG Portfolio
### Otimização Quantitativa de Ativos & Descarbonização Fiduciária na B3

<p align="center">
  <b>Modern Portfolio Theory (Markowitz) · Otimização Convexa SLSQP · Métricas GHG Protocol · Business Intelligence</b>
</p>

<!-- Badges de Domínio e Status -->
<p align="center">
  <img src="https://img.shields.io/badge/Status-Concluído-10B981?style=for-the-badge&logoColor=white" />
  <img src="https://img.shields.io/badge/Mercado-B3_Brasil-1E3A34?style=for-the-badge" />
  <img src="https://img.shields.io/badge/Mandato-R$_500M-064E3B?style=for-the-badge" />
  <img src="https://img.shields.io/badge/Meta_Contratual-≥_40%25_CO₂-D97706?style=for-the-badge" />
  <img src="https://img.shields.io/badge/Resultado_Alcançado--51.48%25_CO₂-10B981?style=for-the-badge&labelColor=064E3B" />
</p>

<!-- Badges de Tecnologias / Hard Skills -->
<p align="center">
  <img src="https://img.shields.io/badge/Python-3.10%2B-1E3A34?style=flat-square&logo=python&logoColor=white" />
  <img src="https://img.shields.io/badge/SciPy-SLSQP_Optimization-10B981?style=flat-square&logo=scipy&logoColor=white" />
  <img src="https://img.shields.io/badge/Pandas-Data_Analysis-150458?style=flat-square&logo=pandas&logoColor=white" />
  <img src="https://img.shields.io/badge/NumPy-Matrix_Covariance-013243?style=flat-square&logo=numpy&logoColor=white" />
  <img src="https://img.shields.io/badge/SQLite-Star_Schema-003B57?style=flat-square&logo=sqlite&logoColor=white" />
  <img src="https://img.shields.io/badge/Power_BI-Executive_Dashboard-D97706?style=flat-square&logo=powerbi&logoColor=white" />
  <img src="https://img.shields.io/badge/DAX-Advanced_Measures-10B981?style=flat-square" />
  <img src="https://img.shields.io/badge/GHG_Protocol-FGVces-22C55E?style=flat-square" />
</p>

> *"Demonstração empírica de que a imposição de filtros de sustentabilidade rigorosos não destrói a fronteira de eficiência fiduciária: é viável superar a meta contratual de -40% de emissões e atingir -51,48% de descarbonização preservando 94% do Índice de Sharpe original."*

---

</div>

## 📌 Sumário Executivo

- [Visão Geral do Projeto](#-visão-geral-do-projeto)
- [O Problema de Negócio (Desafio Fiduciário)](#-o-problema-de-negócio-desafio-fiduciário)
- [Arquitetura de Dados & Modelagem](#-arquitetura-de-dados--modelagem)
- [Formulação Quantitativa & Algoritmo](#-formulação-quantitativa--algoritmo)
- [Resultados Comparativos & Métricas](#-resultados-comparativos--métricas)
- [Dashboard Executivo (Power BI)](#-dashboard-executivo-power-bi)
- [Equipe e Responsabilidades Técnicas (8 Integrantes)](#-equipe-e-responsabilidades-técnicas)
- [Como Reproduzir o Projeto](#-como-reproduzir-o-projeto)
- [Estrutura do Repositório](#-estrutura-do-repositório)

---

## 🎯 Visão Geral do Projeto

O **GreenAlpha ESG Portfolio** é uma solução de finanças quantitativas desenvolvida para comitês de investimento e gestoras de patrimônio[cite: 8]. O sistema combina a **Teoria Moderna de Portfólio (Markowitz)** com os inventários de emissões do **Programa Brasileiro GHG Protocol (FGVces)** para estruturar carteiras na B3 que maximizam o retorno ajustado ao risco enquanto minimizam a intensidade média ponderada de carbono[cite: 1, 8].

### Principais Entregas
1. **Pipeline de Dados:** Extração e normalização de cotações diárias (2022–2024 via Yahoo Finance) e cruzamento com os relatórios de sustentabilidade da FGVces[cite: 1, 4].
2. **Otimizador Não Linear SLSQP:** Resolução numérica de Markowitz via `scipy.optimize.minimize` com restrições operacionais e teto rígido de carbono[cite: 1, 2].
3. **Data Warehouse Analítico:** Modelagem dimensional Star Schema em SQLite (`dim_empresa`, `fato_cotacoes_diarias`, `fato_pesos_carteiras`) com queries de eco-eficiência e rotação setorial[cite: 1, 4].
4. **Dashboard de Tomada de Decisão:** Painel de 4 telas em Power BI contendo KPIs executivos, Fronteira Eficiente com 2.500 simulações de Monte Carlo, radiografia de emissões e Simulador What-If interativo[cite: 1, 2].

---

## 💼 O Problema de Negócio (Desafio Fiduciário)

A **Verde Valores Asset Management** recebeu uma proposta institucional de **R$ 500 milhões** de um fundo de pensão nórdico[cite: 1, 2]. O mandato impunha uma exigência mandatória:

* 🎯 **Meta Solicitada:** A carteira de ações deveria apresentar uma intensidade média de emissões de carbono **pelo menos 40% inferior à média do mercado (Carteira Tradicional)**, com comprovação matemática e dados auditados[cite: 1, 2].

### A Objeção do CIO
A visão tradicional da mesa de investimentos sustentava que desinvestir de empresas de alta representatividade no índice e forte rentabilidade histórica recente (como Petrobras e Vale) destruiria o retorno anual e elevaria o risco da carteira[cite: 1, 2].

### A Resposta Quantitativa
A equipe provou empiricamente que o filtro verde não apenas cumpriu o mandato como **superou a meta contratual ao reduzir as emissões em -51,48%**, mitigando a volatilidade do portfólio e preservando 94% da relação risco-retorno fiduciária[cite: 1, 2].

---

## 🏗️ Arquitetura de Dados & Modelagem


```

```
                  FONTES DE DADOS PÚBLICAS
    ┌──────────────────────────────────────────────────┐
    │   Yahoo Finance API   │   GHG Protocol (FGVces)  │
    │  Cotações 2022 a 2024 │    Escopos 1, 2 e 3      │
    └───────────────┬──────────────────────────┬───────┘
                    │                          │
                    ▼                          ▼
           ┌────────────────────────────────────────┐
           │    Pipeline de Engenharia & Limpeza    │
           │         (Python / Pandas / ETL)        │
           └───────────────────┬────────────────────┘
                               ▼
    ┌────────────────────────────────────────────────────────┐
    │                 Star Schema (fintech_esg.db)            │
    │  • dim_empresa (Perfil, Setor, Emissões e Intensidade) │
    │  • fato_cotacoes_diarias (Histórico, Retorno, Ajustes) │
    │  • fato_pesos_carteiras (Pesos das Estratégias)        │
    │  • resumo_executivo_carteiras (Métricas Consolidadas)  │
    └───────────────┬──────────────────────────┬─────────────┘
                    │                          │
                    ▼                          ▼
    ┌───────────────────────────────┐ ┌──────────────────────┐
    │   Otimização SLSQP & MC       │ │  Camada Analítica BI │
    │  • SciPy / Markowitz          │ │  • Power BI Desktop  │
    │  • Simulação 2.500 carteiras  │ │  • Medidas em DAX    │
    └───────────────────────────────┘ └──────────────────────┘

```

```

### Universo dos 10 Ativos Analisados
| Ticker | Empresa | Setor B3 | Intensidade ($tCO_2e/\text{R\$M}$) | Classificação ESG |
| :--- | :--- | :--- | :---: | :--- |
| `ITUB4.SA` | Itaú Unibanco | Financeiro | **1,8** | Líder Verde (Baixa Emissão) |
| `WEGE3.SA` | WEG | Bens Industriais | **8,4** | Líder Verde (Transição) |
| `RENT3.SA` | Localiza | Consumo Cíclico | **9,2** | Moderada Emissão |
| `CPFE3.SA` | CPFL Energia | Utilidade Pública | **14,5** | Moderada Emissão |
| `EQTL3.SA` | Equatorial Energia | Utilidade Pública | **18,2** | Moderada Emissão |
| `KLBN11.SA` | Klabin | Materiais Básicos | **38,5** | Intensiva com Remoção |
| `SUZB3.SA` | Suzano | Materiais Básicos | **48,0** | Intensiva com Remoção |
| `VBBR3.SA` | Vibra Energia | Petróleo & Biocombustíveis | **54,0** | Intensiva em Escopo 3 |
| `VALE3.SA` | Vale | Materiais Básicos | **88,0** | Alta Intensidade |
| `PETR4.SA` | Petrobras | Petróleo & Gás | **112,0** | Altíssima Intensidade |

---

## 🧮 Formulação Quantitativa & Algoritmo

A modelagem fiduciária maximiza o Índice de Sharpe considerando os retornos anualizados e a taxa livre de risco de 10,5% a.a. ($r_f$, taxa Selic/CDI)[cite: 1, 2]:

$$\max_{w} \; \text{Sharpe} = \frac{w^T \mu - r_f}{\sqrt{w^T \Sigma w}}$$

### Restrições do Sistema
1. **Alocação Plena:** $\sum_{i=1}^{n} w_i = 1$ (100% do capital distribuído)[cite: 1, 2].
2. **Sem Alavancagem e Limite Estatutário:** $0 \le w_i \le 0{,}30$ (máximo de 30% em um único ativo para mitigação de risco idiossincrático)[cite: 1, 2].
3. **Restrição Climática Convexa (Teto Verde):**

$$\sum_{i=1}^{n} w_i \cdot \text{Intensidade}_i \le 20{,}0 \text{ tCO}_2\text{e} / \text{R\$M}$$

---

## 📊 Resultados Comparativos & Métricas

| Métrica | Tradicional (Max Sharpe Irrestrito) | 🌿 **GreenAlpha ESG (Filtro Verde)** | Mínima Volatilidade (Defensiva) |
| :--- | :---: | :---: | :---: |
| **Retorno Anualizado** | 27,66% | **25,92%** | 15,94% |
| **Volatilidade Anualizada** | 18,55% | **17,76%** | 14,65% |
| **Índice de Sharpe** | 0,925 | **0,869** | 0,371 |
| **Intensidade de Carbono ($tCO_2e/M$)** | 41,22 | **20,00** | 27,95 |
| **Meta Solicitada de Redução** | *Baseline* | **-40,00%** | - |
| **Redução Real Atingida** | 0,00% | **-51,48% (Superada)** | -32,18% |
| **Razão de Eco-Eficiência ($Retorno / Carbono$)** | 0,67 | **1,30 (+94%)** | 0,57 |

### Principais Achados
- **Meta Superada:** O mandato exigia corte de pelo menos **40%** de carbono; o modelo alcançou **-51,48%**[cite: 1, 2].
- **Menor Oscilação de Mercado:** A volatilidade caiu de **18,55% para 17,76%**, desmontando a hipótese de que o filtro ambiental aumentaria a instabilidade[cite: 1, 2].
- **Custo Marginal de Retorno:** Abriu-se mão de apenas 1,74 p.p. de retorno (25,92% vs. 27,66%), sustentando **94% do Índice de Sharpe original** (0,869 vs. 0,925)[cite: 1, 2].
- **Salto em Eco-Eficiência:** A produtividade financeira por unidade de poluição quase dobrou (+94%), subindo de 0,67 para **1,30 p.p. de retorno por tonelada de $CO_2e$**[cite: 1, 2].

### Rotação Setorial de Capital
- **Financiador da Redução:** A exposição em Petrobras (`PETR4.SA`) foi reduzida em dois terços (-19,61 p.p., caindo de 29,0% para 9,39%)[cite: 1, 2].
- **Âncoras Limpas:** O capital foi direcionado para o setor financeiro (`ITUB4.SA`, que saltou de 10,3% para 25,03%) e utilidade pública (`CPFE3.SA`, que entrou com 5,58%, somada a `EQTL3.SA` com 30%)[cite: 1, 2].
- **Preservação Estratégica:** `RENT3.SA` permaneceu estável no teto de 30% devido à sua baixa intensidade carbônica relativa (9,2)[cite: 1, 2].

---

## 🖥️ Dashboard Executivo (Power BI)

Construído sob a paleta executiva verde-floresta (`#1E3A34`), verde-esmeralda (`#10B981`) e cinza-ardósia (`#64748B`) presente nos relatórios[cite: 1, 2]:

| Tela | Nome | Conteúdo Analítico |
| :---: | :--- | :--- |
| **01** | **Panorama Executivo** | Cards com KPIs principais, gráfico de barras horizontais comparando as 3 carteiras e decomposição percentual de pesos[cite: 1, 2]. |
| **02** | **Fronteira Eficiente** | Dispersão com 2.500 iterações de Monte Carlo em gradiente contínuo de carbono e destaque para os 3 portfólios ótimos[cite: 1, 2]. |
| **03** | **Radiografia de Emissões** | Cards de escopos (Escopo 1: 65 Mi, Escopo 2: 3 Mi, Escopo 3: 493 Mi)[cite: 13], gráfico decrescente de emissões e matriz detalhada dos ativos[cite: 1, 2]. |
| **04** | **Simulador What-If** | *Slider* com metas de corte (-10% a -50%), recalculando dinamicamente o teto de carbono elegível e o melhor Sharpe[cite: 1, 2]. |

---

## 👥 Equipe e Responsabilidades Técnicas

Estruturação das frentes de trabalho para o time de 8 integrantes[cite: 8]:

| Integrante | Função no Projeto | Entregáveis Técnicos & Hardskills | Contato |
| :--- | :--- | :--- | :--- |
| **[Nome Integrante 1]** | **Engenheiro de Dados** | Extração via API `yfinance`, tratamento de dados de sustentabilidade e modelagem física do Star Schema em SQLite[cite: 8]. | [LinkedIn](#) · [GitHub](#) |
| **[Nome Integrante 2]** | **Analytics Engineer (SQL)** | Desenvolvimento das queries analíticas de auditoria, rotação setorial e cálculo da métrica de Eco-Eficiência[cite: 1, 2]. | [LinkedIn](#) · [GitHub](#) |
| **[Nome Integrante 3]** | **Analista Quantitativo** | Cálculo das séries de retornos logarítmicos, anualização de risco e matriz de covariância dos 10 ativos da B3[cite: 1, 8]. | [LinkedIn](#) · [GitHub](#) |
| **[Nome Integrante 4]** | **Especialista em Otimização** | Formulação de Markowitz com restrição convexa no `scipy.optimize` e parametrização do algoritmo SLSQP[cite: 1, 2]. | [LinkedIn](#) · [GitHub](#) |
| **[Nome Integrante 5]** | **Especialista em Simulação** | Desenvolvimento do script de Monte Carlo com 2.500 simulações de portfólios para mapeamento da Fronteira Eficiente[cite: 1, 2]. | [LinkedIn](#) · [GitHub](#) |
| **[Nome Integrante 6]** | **Engenheiro de BI (DAX)** | Modelagem tabular e medidas DAX (`Retorno_Anualizado_%`, `Indice_Sharpe`, `Eco_Eficiencia_Ratio`, formatação condicional)[cite: 1, 2]. | [LinkedIn](#) · [GitHub](#) |
| **[Nome Integrante 7]** | **Designer de BI & UX/UI** | Desenvolvimento das 4 telas no Power BI Desktop, layout responsivo e configuração do Simulador What-If[cite: 1, 2]. | [LinkedIn](#) · [GitHub](#) |
| **[Nome Integrante 8]** | **Storytelling & QA Executivo** | Estruturação da metodologia STAR, alinhamento dos dados entre Python/SQL/PBI e documentação do repositório[cite: 1, 8]. | [LinkedIn](#) · [GitHub](#) |

---

## 🚀 Como Reproduzir o Projeto

### Pré-requisitos
- Python 3.10+
- Power BI Desktop

### Execução

```bash
# 1. Clonar o repositório
git clone [https://github.com/SEU-USUARIO/GreenAlpha-ESG-Portfolio.git](https://github.com/SEU-USUARIO/GreenAlpha-ESG-Portfolio.git)
cd GreenAlpha-ESG-Portfolio

# 2. Criar e ativar o ambiente virtual
python -m venv venv
# Windows:
venv\Scripts\activate
# Linux/macOS:
source venv/bin/activate

# 3. Instalar dependências
pip install -r requirements.txt

# 4. Executar pipeline e otimizador SLSQP
python scripts/build_esg_portfolio_real.py

```

---

## 📂 Estrutura do Repositório

```text
├── data/
│   ├── dim_empresa.csv                     # Dimensão de empresas, setores e inventário GHG
│   ├── fato_cotacoes_diarias.csv          # Histórico de preços diários B3 (2022-2024)
│   ├── fato_pesos_carteiras.csv           # Alocações percentuais das carteiras
│   ├── fronteira_eficiente_monte_carlo.csv# 2.500 iterações simuladas
│   ├── fintech_esg.db                      # Banco de dados SQLite relacional
│   └── resumo_executivo_carteiras.csv     # Tabela consolidada com os KPIs
├── docs/
│   └── img/                               # Prints das 4 telas do Power BI
├── pbix/
│   └── GreenAlpha_Dashboard.pbix          # Arquivo do Power BI Desktop
├── scripts/
│   ├── build_esg_portfolio_real.py        # Pipeline de coleta, SLSQP e Monte Carlo
│   └── queries_analiticas.sql             # Consultas SQL analíticas
├── requirements.txt
└── README.md

```

---

## ⚖️ Aviso Legal (Disclaimer)

Este projeto foi elaborado para **fins acadêmicos e de portfólio técnico**, utilizando dados históricos do período de 2022 a 2024. **Não constitui recomendação de investimento ou aconselhamento financeiro formal**.

---
