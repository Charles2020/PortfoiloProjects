
select * from ReactionType

--Update reactionType 
--set column = reaction_type
--where Type = type

select * from Reactions

select * from contents


-- COMBINE ALL THREE TABLES 
Select r.Content_ID , r.Type, Category,c.Content_type, t.Sentiment, t.Score, r.Datetime  
from content as c
join reactions as r 
on c.content_id = r.content_id
join reactiontype as t 
on r.type = t.type


-- AGG SCORE 
Select Category, sum(score) as total_score
from content as c
join reactions as r 
on c.content_id = r.content_id
join reactiontype as t 
on r.type = t.type
group by category
order by total_score desc


-- TOP 5 CATEGORY 
Select Category, sum(score) as total_score
from content as c
join reactions as r 
on c.content_id = r.content_id
join reactiontype as t 
on r.type = t.type
group by category
order by total_score desc
offset 0 rows 
fetch next 5 rows only