local cid,id=GetID()
function cid.initial_effect(c)
	--Activate
	local e1=Effect.CreateEffect(c)
	e1:SetCategory(CATEGORY_NEGATE+CATEGORY_DESTROY)
	e1:SetType(EFFECT_TYPE_ACTIVATE)
	e1:SetCode(EVENT_CHAINING)
	e1:SetCondition(cid.condition)
	e1:SetCost(cid.cost)
	e1:SetTarget(cid.target)
	e1:SetOperation(cid.activate)
	c:RegisterEffect(e1)
	--draw
	local e2=Effect.CreateEffect(c)
	e2:SetCategory(CATEGORY_DRAW)
	e2:SetType(EFFECT_TYPE_IGNITION)
	e2:SetProperty(EFFECT_FLAG_PLAYER_TARGET)
	e2:SetRange(LOCATION_GRAVE)
	e2:SetCondition(aux.exccon)
	e2:SetCost(cid.drcost)
	e2:SetTarget(cid.drtg)
	e2:SetOperation(cid.drop)
	c:RegisterEffect(e2)
	--special summon
	local e3=Effect.CreateEffect(c)
	e3:SetType(EFFECT_TYPE_SINGLE+EFFECT_TYPE_TRIGGER_F)
	e3:SetProperty(EFFECT_FLAG_DELAY)
	e3:SetCode(EVENT_TO_HAND)
	e3:SetCondition(cid.condition0)
	e3:SetTarget(cid.target0)
	e3:SetOperation(cid.operation0)
	c:RegisterEffect(e3)
end
function cid.condition(e,tp,eg,ep,ev,re,r,rp)
	return re:IsHasType(EFFECT_TYPE_ACTIVATE) and Duel.IsChainNegatable(ev) and re:GetHandler():IsControler(1-tp) and re:GetHandler():IsCanTurnSet()
end
function cid.cfilter(c)
	return c:IsSetCard(0x617) and c:IsAbleToRemoveAsCost()
end
function cid.cost(e,tp,eg,ep,ev,re,r,rp,chk)
	if chk==0 then return Duel.IsExistingMatchingCard(cid.cfilter,tp,LOCATION_GRAVE,0,1,nil) end
	Duel.Hint(HINT_SELECTMSG,tp,HINTMSG_REMOVE)
	local g=Duel.SelectMatchingCard(tp,cid.cfilter,tp,LOCATION_GRAVE,0,1,1,nil)
	Duel.Remove(g,POS_FACEUP,REASON_COST)
end
function cid.target(e,tp,eg,ep,ev,re,r,rp,chk)
	if chk==0 then return true end
	Duel.SetOperationInfo(0,CATEGORY_NEGATE,eg,1,0,0)
	if re:GetHandler():IsDestructable() and re:GetHandler():IsRelateToEffect(re) then
		Duel.SetOperationInfo(0,CATEGORY_DESTROY,eg,1,0,0)
	end
end
function cid.activate(e,tp,eg,ep,ev,re,r,rp)
	local tc=re:GetHandler()
	if Duel.NegateActivation(ev) and tc:IsCanTurnSet() then
		tc:CancelToGrave()
		Duel.ChangePosition(tc,POS_FACEDOWN)
		tc:RegisterFlagEffect(id,RESET_EVENT+RESETS_STANDARD+RESET_PHASE+PHASE_STANDBY,0,1)
		local e1=Effect.CreateEffect(e:GetHandler())
		e1:SetType(EFFECT_TYPE_SINGLE)
		e1:SetProperty(EFFECT_FLAG_OWNER_RELATE)
		e1:SetCode(EFFECT_CANNOT_TRIGGER)
		e1:SetReset(RESET_EVENT+RESETS_STANDARD+RESET_PHASE+PHASE_STANDBY)
		e1:SetCondition(cid.rcon)
		e1:SetValue(1)
		tc:RegisterEffect(e1)
	end
end
function cid.rcon(e)
	return e:GetHandler():GetFlagEffect(id)~=0
end
function cid.cfilter(c,bool)
	if bool then return c:IsSetCard(0x617) and c:IsAbleToRemoveAsCost() else return c:IsSetCard(0x617) and c:IsAbleToRemove() end
end
function cid.drcost(e,tp,eg,ep,ev,re,r,rp,chk)
	local c=e:GetHandler()
	if chk==0 then return c:IsAbleToRemoveAsCost()
		and Duel.IsExistingMatchingCard(cid.cfilter,tp,LOCATION_GRAVE,0,1,c,true) end
	Duel.Hint(HINT_SELECTMSG,tp,HINTMSG_REMOVE)
	local g=Duel.SelectMatchingCard(tp,cid.cfilter,tp,LOCATION_GRAVE,0,1,1,c,true)
	g:AddCard(c)
	Duel.Remove(g,POS_FACEUP,REASON_COST)
end
function cid.drtg(e,tp,eg,ep,ev,re,r,rp,chk)
	if chk==0 then return Duel.IsPlayerCanDraw(tp,2) end
	Duel.SetTargetPlayer(tp)
	Duel.SetTargetParam(1)
	Duel.SetOperationInfo(0,CATEGORY_DRAW,nil,0,tp,2)
end
function cid.drop(e,tp,eg,ep,ev,re,r,rp)
	local p,d=Duel.GetChainInfo(0,CHAININFO_TARGET_PLAYER,CHAININFO_TARGET_PARAM)
	Duel.Draw(p,d,REASON_EFFECT)
end
function cid.condition0(e,tp,eg,ep,ev,re,r,rp)
	return (not e:GetHandler():IsReason(REASON_DRAW)) and e:GetHandler():IsPreviousLocation(LOCATION_DECK) and e:GetHandler():GetPreviousControler()==tp
end
function cid.target0(e,tp,eg,ep,ev,re,r,rp,chk)
	if chk==0 then return true end
end
function cid.operation0(e,tp,eg,ep,ev,re,r,rp)
	if Duel.IsExistingMatchingCard(cid.cfilter,tp,LOCATION_GRAVE,0,1,nil,false) and Duel.SelectYesNo(tp,1102) then
		local g=Duel.SelectMatchingCard(tp,cid.cfilter,tp,LOCATION_GRAVE,0,1,1,nil,false)
		Duel.Remove(g,POS_FACEUP,REASON_EFFECT)
	else
		Duel.SendtoGrave(e:GetHandler(),REASON_EFFECT+REASON_DISCARD)
	end
end
