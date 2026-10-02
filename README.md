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

> *"Demonstração empírica de que a imposição de filtros de sustentabilidade rigorosos não destrói a fronteira de eficiência fiduciária: é viável superar a meta contratual de corte de pelo menos 40% de emissões e atingir -51,48% de descarbonização preservando 94% do Índice de Sharpe original."*

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

O **GreenAlpha ESG Portfolio** é uma solução de finanças quantitativas desenvolvida para comitês de investimento e gestoras de recursos[cite: 8]. O sistema combina a **Teoria Moderna de Portfólio (Markowitz)** com inventários de emissões do **Programa Brasileiro GHG Protocol (FGVces)** para estruturar carteiras de ativos na B3 que equilibram o retorno ajustado ao risco com a minimização da intensidade média ponderada de carbono[cite: 1, 8].

### Principais Entregas
1. **Pipeline de Dados:** Extração e normalização de séries históricas de cotações diárias (período de 2022 a 2024 via Yahoo Finance) e cruzamento com inventários corporativos oficiais do GHG Protocol (FGVces)[cite: 1, 4, 8].
2. **Otimizador Numérico SLSQP:** Resolução matemática da fronteira de eficiência de Markowitz via `scipy.optimize.minimize`, aplicando restrições operacionais e teto rígido de carbono[cite: 1, 4].
3. **Data Warehouse Analítico:** Modelagem dimensional em Star Schema no SQLite (`fintech_esg.db`), permitindo consultas analíticas sobre eco-eficiência, rotação setorial e inventários de escopos corporativos[cite: 1, 4].
4. **Dashboard de Tomada de Decisão:** Painel de 4 telas em Power BI Desktop com KPIs executivos, Fronteira Eficiente mapeada via Monte Carlo (2.500 iterações), radiografia de emissões corporativas e Simulador What-If interativo[cite: 1, 4, 8].

---

## 💼 O Problema de Negócio (Desafio Fiduciário)

A **Verde Valores Asset Management** gere R$ 4 bilhões na Faria Lima e recebeu uma proposta institucional de **R$ 500 milhões** de um fundo soberano de pensão dos países nórdicos[cite: 1, 4]. O mandato estabeleceu uma exigência mandatória:

* 🎯 **Meta Solicitada:** A carteira de ações deve apresentar uma intensidade média de emissões de carbono **pelo menos 40% inferior à média do mercado (Carteira Tradicional)**, com comprovação matemática rigorosa e sem margem para *greenwashing*[cite: 1, 4].

### A Objeção do CIO
O Chief Investment Officer (CIO) tradicional da casa levantou objeções contra o mandato, sustentando que cortar ativos de alto peso e rentabilidade histórica (como Petrobras e Vale) destruiria o retorno anual da carteira e aumentaria a volatilidade do fundo[cite: 1, 4].

### A Resposta Empírica
A equipe provou quantitativamente que o portfólio não apenas atendeu ao mandato como **superou a meta estipulada ao alcançar -51,48% de descarbonização**, operando com menor oscilação de mercado (volatilidade em 17,76% contra 18,55%) e mantendo 94% da relação risco-retorno fiduciária[cite: 1, 3, 4].

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
| `WEGE3.SA` | WEG | Bens Industriais | **8,4** | Líder Verde (Transição Energética) |
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

A modelagem baseia-se na maximização da Razão de Sharpe sobre retornos anualizados com taxa livre de risco de 10,5% a.a. ($r_f$, benchmark Selic/CDI):

$$\max_{w} \text{Sharpe} = \frac{w^T \mu - r_f}{\sqrt{w^T \Sigma w}}$$

### Restrições do Sistema

1. **Alocação Plena:** $\sum_{i=1}^{n} w_i = 1$ (100% do capital distribuído).
2. **Sem Alavancagem e Limite Estatutário:** $0 \le w_i \le 0{,}30$ (sem posições vendidas; teto máximo de 30% por ativo para diluição de risco idiossincrático).
3. **Restrição Climática Convexa (Teto Verde):**

$$\sum_{i=1}^{n} w_i \cdot \text{Intensidade}_i \le 20{,}0$$

*(Onde a intensidade média ponderada resultante é limitada ao teto de $20{,}0\text{ tCO}_2\text{e}$ por milhão de reais de receita).*

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

### Principais Conclusões
- **Meta Superada com Folga:** O mandato exigia corte de pelo menos **40%** de emissões; o portfólio alcançou **-51,48%** de descarbonização[cite: 1, 3, 4].
- **Menor Oscilação:** A volatilidade caiu de **18,55% para 17,76%**, refutando a premissa de que filtros socioambientais elevam o risco[cite: 1, 3, 4].
- **Custo Marginal de Retorno:** Abriu-se mão de apenas 1,74 p.p. de retorno (25,92% vs. 27,66%), preservando **94% do Índice de Sharpe original** (0,869 vs. 0,925)[cite: 1, 3, 4].
- **Salto em Eco-Eficiência:** A produtividade financeira por emissão subiu **+94%** (de 0,67 para **1,30 p.p. de retorno por tonelada de $CO_2e$**)[cite: 1, 3, 4].

### Rotação Setorial de Capital
- **Financiador da Redução:** A exposição em Petrobras (`PETR4.SA`) sofreu desinvestimento de dois terços (-19,61 p.p., caindo de 29,0% para 9,39%)[cite: 1, 3, 4].
- **Absorção Limpa:** O capital foi alocado no setor Financeiro (`ITUB4.SA`, que subiu de 10,3% para 25,03%) e Utilidade Pública (`CPFE3.SA`, com 5,58%, somada a `EQTL3.SA`, com 30%)[cite: 1, 3, 4].
- **Resiliência Seletiva:** `RENT3.SA` foi mantida no limite de 30% por conciliar rentabilidade com intensidade moderada (9,2)[cite: 1, 3, 4].

---

## 🖥️ Dashboard Executivo (Power BI)

Construído sob a identidade visual corporativa verde-floresta (`#1E3A34`), verde-esmeralda (`#10B981`) e cinza-ardósia (`#64748B`), o painel possui 4 telas analíticas[cite: 1, 2, 4]:

| Tela | Nome | Funcionalidades & Visualizações |
| :---: | :--- | :--- |
| **01** | **Panorama Executivo** | Cards com os 4 KPIs centrais, comparativo de barras horizontais entre estratégias e gráfico de barras 100% empilhadas detalhando a decomposição dos pesos por ativo[cite: 1, 2, 4]. |
| **02** | **Fronteira Eficiente** | Dispersão com as 2.500 iterações de Monte Carlo em gradiente contínuo de carbono e destaque direto dos 3 pontos ótimos (Mínima Volatilidade, Tangência Verde e Tradicional)[cite: 1, 2, 4, 9]. |
| **03** | **Radiografia de Emissões** | Cards de escopos (Escopo 1: 65 Mi, Escopo 2: 3 Mi, Escopo 3: 493 Mi)[cite: 1, 4], ranking decrescente de emissões totais liderado por Petrobras e Vale, e matriz analítica de ativos[cite: 1, 4, 11]. |
| **04** | **Simulador What-If** | *Slider* com metas de corte (-10% a -50%), recalculando dinamicamente o teto de carbono elegível e o melhor Sharpe resultante em tempo real[cite: 1, 4, 8]. |

---

## 👥 Equipe e Responsabilidades Técnicas

Estruturação das frentes de trabalho para o time de 8 integrantes[cite: 4, 8]:

| Integrante | Função no Projeto | Entregáveis Técnicos & Hardskills | Contato |
| :--- | :--- | :--- | :--- |
| **[Nome Integrante 1]** | **Engenheiro de Dados** | Extração via API `yfinance`, tratamento de dados de sustentabilidade e modelagem física do Star Schema em SQLite[cite: 4, 8]. | [LinkedIn](#) · [GitHub](#) |
| **[Nome Integrante 2]** | **Analytics Engineer (SQL)** | Desenvolvimento das queries analíticas de auditoria, rotação setorial e cálculo da métrica de Eco-Eficiência[cite: 1, 4]. | [LinkedIn](#) · [GitHub](#) |
| **[Nome Integrante 3]** | **Analista Quantitativo** | Cálculo das séries de retornos logarítmicos, anualização de risco e matriz de covariância dos 10 ativos da B3[cite: 1, 4, 8]. | [LinkedIn](#) · [GitHub](#) |
| **[Nome Integrante 4]** | **Especialista em Otimização** | Formulação de Markowitz com restrição convexa no `scipy.optimize` e parametrização do algoritmo SLSQP[cite: 1, 4]. | [LinkedIn](#) · [GitHub](#) |
| **[Nome Integrante 5]** | **Especialista em Simulação** | Desenvolvimento do script de Monte Carlo com 2.500 simulações de portfólios para mapeamento da Fronteira Eficiente[cite: 1, 4]. | [LinkedIn](#) · [GitHub](#) |
| **[Nome Integrante 6]** | **Engenheiro de BI (DAX)** | Modelagem tabular e medidas DAX (`Retorno_Anualizado_%`, `Indice_Sharpe`, `Eco_Eficiencia_Ratio`, formatação condicional)[cite: 1, 4]. | [LinkedIn](#) · [GitHub](#) |
| **[Nome Integrante 7]** | **Designer de BI & UX/UI** | Desenvolvimento das 4 telas no Power BI Desktop, layout responsivo e configuração do Simulador What-If[cite: 1, 4]. | [LinkedIn](#) · [GitHub](#) |
| **[Nome Integrante 8]** | **Storytelling & QA Executivo** | Estruturação da metodologia STAR, alinhamento dos dados entre Python/SQL/PBI e documentação do repositório[cite: 1, 4, 8]. | [LinkedIn](#) · [GitHub](#) |

---

## 🚀 Como Reproduzir o Projeto

### Pré-requisitos
- Python 3.10 ou superior
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
│   └── img/                               # Demonstrações visuais das 4 telas do Power BI
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
