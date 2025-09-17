echo "module load eecs484" >> ~/.bash_profile
echo "module load mongodb" >> ~/.bash_profile
rlwrap sqlplus
@createTables
@loadData
@createViews
@testViews
@dropViews
@dropTables