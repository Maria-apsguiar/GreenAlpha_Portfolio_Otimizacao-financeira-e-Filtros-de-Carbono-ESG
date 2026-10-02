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
  <img src="https://img.shields.io/badge/Meta_ESG--51.48%25_CO₂-34D399?style=for-the-badge&labelColor=064E3B" />
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

> *"Demonstração empírica de que a imposição de filtros de sustentabilidade rigorosos não destrói a fronteira de eficiência fiduciária: é viável descarbonizar mais de 50% de um portfólio de ações preservando 94% do Índice de Sharpe."*

---

</div>

## 📌 Sumário Executivo

- [Visão Geral do Projeto](#-visão-geral-do-projeto)
- [O Problema de Negócio (Desafio Fiduciário)](#-o-problema-de-negócio-desafio-fiduciário)
- [Arquitetura de Dados & Modelagem](#-arquitetura-de-dados--modelagem)
- [Formulação Quantitativa & Algoritmo](#-formulação-quantitativa--algoritmo)
- [Resultados Comparativos & Métricas](#-resultados-comparativos--métricas)
- [Dashboard Executivo (Power BI)](#-dashboard-executivo-power-bi)
- [Divisão da Equipe & Hardskills](#-equipe-e-responsabilidades-técnicas)
- [Como Reproduzir o Projeto](#-como-reproduzir-o-projeto)
- [Estrutura do Repositório](#-estrutura-do-repositório)

---

## 🎯 Visão Geral do Projeto

O **GreenAlpha ESG Portfolio** é uma solução quantitativa desenvolvida para gestores de ativos, family offices e comitês de alocação de recursos. O sistema combina a **Teoria Moderna de Portfólio (Markowitz)** com inventários de emissões do **Programa Brasileiro GHG Protocol (FGVces)** para estruturar carteiras de investimento na B3 que maximizam o retorno ajustado ao risco enquanto minimizam a intensidade de carbono ponderada.

### Principais Entregas
1. **Pipeline ETL:** Extração automatizada de cotações históricas diárias (2022–2024) via API e cruzamento com dados corporativos de emissões.
2. **Otimizador Convexo:** Algoritmo em Python utilizando `scipy.optimize.minimize` (método SLSQP) com restrições operacionais e teto de carbono.
3. **Data Warehouse (Star Schema):** Modelagem relacional analítica em SQLite para cálculo de rotação setorial e eco-eficiência.
4. **Dashboard Executivo:** Painel completo de tomada de decisão com simulação de Monte Carlo (2.500 iterações), radiografia de emissões e simulador What-If interativo.

---

## 💼 O Problema de Negócio (Desafio Fiduciário)

A **Verde Valores Asset Management** recebeu uma proposta institucional de **R$ 500 milhões** de um fundo de pensão nórdico com a exigência mandatória de estruturar uma carteira com pegada de carbono auditada **pelo menos 40% inferior à média do mercado**.

### O Dilema do CIO Tradicional
A gestão tradicional apontava que desinvestir de empresas de alto peso no índice Ibovespa (como Petrobras e Vale) acarretaria:
- Destruição da taxa de retorno esperada.
- Aumento da volatilidade e do risco de cauda do portfólio.
- Piora significativa na relação risco-retorno (Índice de Sharpe).

### A Resposta Empírica
O projeto comprovou matematicamente que a exclusão/redução de emissores fósseis pode ser absorvida eficientemente por setores limpos de infraestrutura e serviços (como Financeiro e Energia Renovável), mitigando a volatilidade global e mantendo a produtividade do capital.

---

## 🏗️ Arquitetura de Dados & Modelagem
