
## Left Behind *Places*

### The Index of Multiple Deprivation
The [IMD](https://www.gov.uk/government/publications/english-indices-of-deprivation-2019-technical-report) is a measure of relative deprivation calculated every five years, comprised of seven domains assigned varying weights: Income, Employment, Disability and Health, Education and Skills, Barriers to Housing and Services, Living Environment and Crime (DCLG, 2019). The IMD is available at the [Lower Super Output Area (LSOA) scale](https://borders.ukdataservice.ac.uk/easy_download_data.html?data=England_lsoa_2011). 

When identifying a place as “left behind”, we consider small areas that experience sustained high levels of deprivation. In the absence of other metrics at this scale the English Indices of Multiple Deprivation (IMD) is used as a proxy - specifically trajectories of change in deprivation over time. 

### Deprivation over time
To include data from 2010 (prior to the last Census date of 2011), it was necessary to [recalculate data from the former 2001 LSOA boundaries into the current 2011 boundaries](https://github.com/fcorowe/left_behind/blob/master/places/DeprivationTrajectories_NotesonMethods.pdf), reflecting changes in population distribution.During this period, the number of LSOA increased from 32,482 in 2001 to 32,844 in 2011. 

We categorise areas according to the deprivation decile within which they were classified over the last decade, based on data from [2010](https://www.gov.uk/government/statistics/english-indices-of-deprivation-2010), [2015](https://www.gov.uk/government/statistics/english-indices-of-deprivation-2015) and [2019](https://www.gov.uk/government/statistics/english-indices-of-deprivation-2019). To summarise the frequency of different trajectories between 2010, 2015 and 2019 use the following R code:

```
data_summ = data %>% 
  group_by(2010_DECILE, 2015_DECILE, 2019_DECILE) %>% 
  summarise(COUNT=n())
data_summ
```
A summary of the frequency of deprivation trajectories are available [here](https://github.com/fcorowe/left_behind/blob/master/places/IMD_TrajectoryFrequency.xlsx).

### Identifying common trajectories
Deprivation trajectories are further analysed using [Sequence Analysis](http://traminer.unige.ch/user.shtml), a technique that allows us to understand whether there are typical and recurrent trajectories within our dataset using the [TraMineR](http://traminer.unige.ch/install.shtml) package. The sequence analysis code can be found [here](). 

Our grouped trajectories were also compared using the original IMD domains from 2019 (see figure below), the code is available [here](https://github.com/fcorowe/left_behind/edit/master/places/domains_plot.r). 

![Violin_400](https://user-images.githubusercontent.com/57355504/94684946-a6f76500-0320-11eb-81f6-46be2643323c.jpg)

Sankey plots showing change in trajectories over time were created using the [ggsankey](https://github.com/davidsjoberg/ggsankey) package. Find the code [here](https://github.com/fcorowe/left_behind/blob/master/places/sankey.R).

<img width="4716" alt="sankey_experiment_500" src="https://user-images.githubusercontent.com/57355504/167625628-04b58756-91f7-4fac-bce1-229499773f55.png">

