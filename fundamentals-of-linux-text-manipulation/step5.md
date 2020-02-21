#### A) Sort the words according to their occurrencies

<u>Hint:</u> use sort -nr

#### B) List the 10 most common words from Inferno and Paradiso

#### C) Create a table with words appearing both in Inferno and Paradiso, listing the occurrencies in the two sections 

<u>Hint:</u> Use join but sort theme beforehand

#### D) Compute a 'paradisiac' score based on their occurrencies and add it as a new column

Define 'paradisiac' score for word x as: 


 score(x) = (x<sub>p</sub>-x<sub>i</sub>)/(x<sub>p</sub>+x<sub>i</sub>)


where x<sub>p</sub> is the number of occurrencies in Paradiso, 
and x<sub>i</sub> is the number of occurrencies of word x in inferno

<u>Hint:</u> Use awk. 

#### E) Sort words based on the 'paradisiac' score

#### F) List the 10 words with highest and lowest 'paradisiac' scores
