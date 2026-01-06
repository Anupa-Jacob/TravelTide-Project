# TravelTide Customer Segmentation & Rewards Program

## Project Overview

TravelTide, a prominent player in the travel industry, implemented a data-driven customer segmentation strategy to design a personalized rewards program. This project analyzed user behavior on the travel platform to identify five distinct customer segments, each receiving tailored perks designed to boost engagement, foster loyalty, and drive sustainable growth.

## Objective

Segment users based on behavioral patterns and assign personalized perks to transform occasional users into loyal advocates and frequent travelers into lifelong partners.

## Key Deliverables

- **Customer Segmentation Analysis**: Identified 5 distinct user segments using K-Means clustering with PCA
- **Personalized Perk Assignment**: Matched each segment with relevant perks based on behavioral insights
- **Interactive Tableau Dashboards**: Visual analytics for stakeholder decision-making
- **Actionable Recommendations**: Strategic guidance for marketing and retention initiatives

## Project Structure

```
TravelTide-Segmentation/
├── data/
│   ├── user_features.csv                 # Aggregated user-level features
│   ├── user_features_clustered.csv       # Final dataset with cluster assignments
│   └── geo_sessions.csv                  # Geographic data for mapping
├── notebooks/
│   └── traveltide_segmentation.ipynb     # Complete analysis workflow
├── reports/
│   ├── TravelTide_Analysis.pdf           # Detailed project report
│   └── TravelTide_Presentation.pdf       # Executive summary slides
├── tableau/
│   └── TravelTide_Dashboard.twbx         # Interactive Tableau workbook
├── images/
│   ├── cluster_visualization.png
│   ├── segment_distribution.png
│   └── pca_3d_plot.png
└── README.md
```

## Data Sources

**Database**: PostgreSQL (TravelTide production database)

**Tables Used**:
- `users` (1,020,926 rows) - User demographics and registration data
- `sessions` (5,408,063 rows) - Browsing and interaction history
- `flights` (1,901,038 rows) - Flight booking details
- `hotels` (1,918,617 rows) - Hotel reservation information

**Analysis Period**: Sessions after January 4, 2023, with users having >7 sessions

## Methodology

### 1. Data Preparation
- **Session Filtering**: Focused on active users (>7 sessions post-Jan 2023)
- **Data Cleaning**: Corrected timestamp inconsistencies, handled missing values
- **Feature Engineering**: Created 16 behavioral, financial, and demographic metrics

### 2. Clustering Approach
- **Technique**: K-Means clustering with PCA dimensionality reduction
- **Components**: 10 principal components capturing 90% variance
- **Validation**: Silhouette score analysis (k=5: 0.1266)
- **Business Constraint**: Fixed at 5 clusters to align with 5 reward types

### 3. Segment Validation
- Statistical profiling of booking patterns
- Behavioral metric analysis (cancellation rates, discount usage)
- Demographic correlation studies

## Customer Segments & Perks

| Cluster | Segment | Users | Perk | Rationale |
|---------|---------|-------|------|-----------|
| **0** | **Family & Group Travelers** | 515 (8.6%) | Family Comfort Package | 96.1% book multiple rooms, 72.8% book multiple seats |
| **1** | **Occasional Voyagers** | 1,692 (28.2%) | Starter Flight Boost (25% discount) | Lowest booking frequency (1.85 avg), needs activation |
| **2** | **Frequent Business Flyers** | 585 (9.8%) | Lounge Access + No-Fee Cancellation | Highest cancellation rate (17%), values flexibility |
| **3** | **Road Warriors** | 1,601 (26.7%) | Priority Boarding + Fast-Track Security | Highest bookings (7.75), zero cancellations |
| **4** | **Steady Explorers** | 1,605 (26.8%) | Deal Alerts + Free Checked Bag | Moderate activity, 62.4% check bags regularly |

## Key Findings

### Booking Behavior
- **Most Active**: Road Warriors (7.75 avg bookings)
- **Least Active**: Occasional Voyagers (1.85 avg bookings)
- **Highest Cancellation**: Frequent Business Flyers (17% rate)

### Spending Patterns
- **Premium Payers**: Family & Group Travelers ($602 median base fare)
- **Budget Conscious**: Occasional Voyagers ($359 median base fare)

### Discount Sensitivity
- **Heavy Discount Users**: Frequent Business Flyers (2.34 flight + 2.01 hotel discounts)
- **Low Discount Users**: Road Warriors (1.21 flight + 0.64 hotel discounts)

## Technology Stack

- **Programming**: Python 3.12
- **Data Processing**: Pandas, NumPy
- **Machine Learning**: Scikit-learn (K-Means, PCA, DBSCAN)
- **Visualization**: Matplotlib, Seaborn, Plotly
- **Database**: PostgreSQL, SQLAlchemy
- **Business Intelligence**: Tableau Desktop

## Installation & Setup

```bash
# Clone repository
git clone https://github.com/Anupa-Jacob/TravelTide-Project/tree/main
cd traveltide-segmentation

# Create virtual environment
python -m venv venv
source venv/bin/activate  # Windows: venv\Scripts\activate

# Install dependencies
pip install -r requirements.txt
```

### Requirements
```txt
pandas==2.1.4
numpy==1.26.2
matplotlib==3.8.2
seaborn==0.13.0
scikit-learn==1.3.2
sqlalchemy==2.0.23
psycopg2==2.9.9
plotly==5.18.0
```

### Running the Analysis

```python
# Load and execute the Jupyter notebook
[jupyter notebook notebooks/traveltide_segmentation.ipynb](https://drive.google.com/file/d/1hjh4dpXmKu2wba0evB6eOynFMNHC2io0/view?usp=sharing)
```

### Viewing Tableau Dashboards

Open `https://public.tableau.com/app/profile/anupa.jacob.parady/viz/TravelTideProject_17568701540520/SegmentSizeTotalRevenue` in Tableau Desktop




## Business Impact

### Expected Outcomes
- **Increased Engagement**: Tailored perks drive 15-25% uplift in repeat bookings
- **Improved Retention**: Personalization reduces churn by 10-15%
- **Higher CLV**: Segment-specific strategies increase customer lifetime value
- **Operational Efficiency**: Targeted perks optimize resource allocation

### Strategic Recommendations

1. **Prioritize High-Value Segments**
   - Focus on Road Warriors (26.7%) and Steady Explorers (26.8%)
   - Implement premium loyalty tiers for top performers

2. **Activate Occasional Voyagers**
   - Deploy aggressive welcome campaigns (25% discount)
   - Retargeting strategies to convert browse-to-book

3. **Retain Business Travelers**
   - Enhance flexibility with no-fee cancellations
   - Premium lounge partnerships for competitive advantage

4. **Support Family Travelers**
   - Seasonal group promotions during school holidays
   - Family-friendly package deals

5. **Continuous Optimization**
   - A/B test perk variations within segments
   - Monitor KPIs: booking frequency, CLV, NPS by segment
   - Quarterly segmentation refresh to capture evolving behaviors

## Validation & Quality Assurance

- **Silhouette Analysis**: Validated cluster separation
- **Business Logic Review**: Cross-checked segment behaviors with domain expertise
- **Holdout Testing**: Reserved 20% of users for validation
- **Stakeholder Feedback**: Iterative refinement with marketing team

## Future Enhancements

- **Real-Time Segmentation**: Integrate with live booking system
- **Predictive Modeling**: Churn prediction per segment
- **Dynamic Perk Optimization**: ML-driven perk recommendation engine
- **Advanced Analytics**: RFM scoring, cohort analysis
- **Multi-Channel Integration**: Email, mobile app, website personalization

## Contributors

- [Anupa]
- **Business Analyst**: TravelTide Marketing Team
- **Stakeholders**: Product, Marketing, Executive Leadership

## License

This project is proprietary to TravelTide. Unauthorized distribution prohibited.







