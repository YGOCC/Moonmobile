--Medivatale Mad Hatter
function c160008804.initial_effect(c)
   c:EnableReviveLimit()
	aux.AddOrigEvoluteType(c)
   aux.AddEvoluteProc(c,nil,3,aux.FilterBoolFunction(Card.IsSetCard,0xab5),1,99)
end

