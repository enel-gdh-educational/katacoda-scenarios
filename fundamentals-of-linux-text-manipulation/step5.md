#### A) Sort the words according to their occurrencies

Hint: use sort -nr

#### B) List the 10 most common words from Inferno and Paradiso

#### C) Create a table with words appearing both in Inferno and Paradiso, listing the occurrencies in the two sections 

Hint: Use join but sort theme beforehand

#### D) Compute a 'paradisiac' score based on their occurrencies and add it as a new column

Define 'paradisiac' score for word x as :math:`\frac(x_p-x_i)/(x_p+x_i)` 
where x_p is the number of occurrencies in Paradiso, 
and x_i is the number of occurrencies of word x in inferno

Hint: Use awk. 

#### E) Sort words based on the 'paradisiac' score

#### F) List the 10 words with highest and lowest 'paradisiac' scores
