select N, CASE
    when p is null then 'Root'
    when N in (select p from BST) then 'Inner'
    else 'Leaf'
    end
from BST
order by N;
