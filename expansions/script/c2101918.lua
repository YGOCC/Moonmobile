--Mokey's Wishes
function c2101918.initial_effect(c)
	--Activate
	local e1=Effect.CreateEffect(c)
	e1:SetCategory(CATEGORY_DRAW)
	e1:SetType(EFFECT_TYPE_ACTIVATE)
	e1:SetProperty(EFFECT_FLAG_PLAYER_TARGET)
	e1:SetCode(EVENT_FREE_CHAIN)
	e1:SetCountLimit(1,2101918+EFFECT_COUNT_CODE_OATH)
	e1:SetCondition(c2101918.condition)
	e1:SetTarget(c2101918.target)
	e1:SetOperation(c2101918.activate)
	c:RegisterEffect(e1)
end
function c2101918.cfilter(c)
	return c:IsFaceup() and c:IsCode(27288416,13803864)
end
function c2101918.condition(e,tp,eg,ep,ev,re,r,rp)
	return Duel.IsExistingMatchingCard(c2101918.cfilter,tp,LOCATION_ONFIELD,0,1,nil)
end
function c2101918.target(e,tp,eg,ep,ev,re,r,rp,chk)
	if chk==0 then return Duel.IsPlayerCanDraw(tp,2) end
	Duel.SetTargetPlayer(tp)
	Duel.SetTargetParam(2)
	Duel.SetOperationInfo(0,CATEGORY_DRAW,nil,0,tp,2)
end
function c2101918.activate(e,tp,eg,ep,ev,re,r,rp)
	local p,d=Duel.GetChainInfo(0,CHAININFO_TARGET_PLAYER,CHAININFO_TARGET_PARAM)
	Duel.Draw(p,d,REASON_EFFECT)
end
