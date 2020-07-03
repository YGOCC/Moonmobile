 --Created and coded by Rising Phoenix
function c100000951.initial_effect(c)
c:SetUniqueOnField(1,0,100000951)
	--synchro summon
	aux.AddSynchroProcedure(c,aux.FilterBoolFunction(Card.IsSetCard,0x75C),aux.NonTuner(Card.IsSetCard,0x75C),1)
	c:EnableReviveLimit()
		local e1=Effect.CreateEffect(c)
	e1:SetDescription(aux.Stringid(100000951,1))
	e1:SetCategory(CATEGORY_TODECK)
	e1:SetType(EFFECT_TYPE_IGNITION)
	e1:SetCode(EVENT_FREE_CHAIN)
	e1:SetRange(LOCATION_MZONE)
	e1:SetCountLimit(1)
	e1:SetHintTiming(0,0x1c0)
	e1:SetProperty(EFFECT_FLAG_PLAYER_TARGET+EFFECT_FLAG_DAMAGE_STEP)
	e1:SetTarget(c100000951.targethh)
	e1:SetOperation(c100000951.activatehh)
	e1:SetCost(c100000951.cost)
	c:RegisterEffect(e1)
		local e2=Effect.CreateEffect(c)
	e2:SetDescription(aux.Stringid(100000951,0))
	e2:SetCategory(CATEGORY_DISABLE)
	e2:SetType(EFFECT_TYPE_IGNITION)
	e2:SetRange(LOCATION_GRAVE)
	e2:SetProperty(EFFECT_FLAG_CARD_TARGET)
	e2:SetCode(EVENT_FREE_CHAIN)
	e2:SetCost(c100000951.negcost)
	e2:SetTarget(c100000951.target)
	e2:SetOperation(c100000951.activate2)
	c:RegisterEffect(e2)
		local e3=Effect.CreateEffect(c)
	e3:SetDescription(aux.Stringid(100000951,2))
	e3:SetCategory(CATEGORY_TODECK)
	e3:SetType(EFFECT_TYPE_IGNITION)
	e3:SetCode(EVENT_FREE_CHAIN)
	e3:SetRange(LOCATION_MZONE)
	e3:SetCountLimit(1)
	e3:SetHintTiming(0,0x1c0)
	e3:SetProperty(EFFECT_FLAG_DELAY+EFFECT_FLAG_DAMAGE_STEP)
	e3:SetTarget(c100000951.targethh2)
	e3:SetOperation(c100000951.activatehh2)
	e3:SetCost(c100000951.cost)
	c:RegisterEffect(e3)
		local e4=Effect.CreateEffect(c)
	e4:SetDescription(aux.Stringid(100000951,3))
	e4:SetCategory(CATEGORY_TODECK)
	e4:SetType(EFFECT_TYPE_IGNITION)
	e4:SetCode(EVENT_FREE_CHAIN)
	e4:SetRange(LOCATION_MZONE)
	e4:SetCountLimit(1)
	e4:SetHintTiming(0,0x1c0)
	e4:SetTarget(c100000951.targethh3)
	e4:SetProperty(EFFECT_FLAG_DELAY+EFFECT_FLAG_DAMAGE_STEP)
	e4:SetOperation(c100000951.activatehh3)
	e4:SetCost(c100000951.cost)
	c:RegisterEffect(e4)	
	--half damage
	local e14=Effect.CreateEffect(c)
	e14:SetType(EFFECT_TYPE_CONTINUOUS+EFFECT_TYPE_FIELD)
	e14:SetRange(LOCATION_MZONE)
	e14:SetCode(EVENT_PRE_BATTLE_DAMAGE)
	e14:SetCondition(c100000951.dxcon)
	e14:SetOperation(c100000951.dxop)
	c:RegisterEffect(e14)
end
function c100000951.dxcon(e,tp,eg,ep,ev,re,r,rp)
	local c=e:GetHandler()
	return ep~=tp and (c==Duel.GetAttacker() or c==Duel.GetAttackTarget())
end
function c100000951.dxop(e,tp,eg,ep,ev,re,r,rp)
	Duel.ChangeBattleDamage(ep,ev/2)
end
function c100000951.synlimit(e,c)
	if not c then return false end
	return not c:IsSetCard(0x75C)
end
function c100000951.activatehh3(e,tp,eg,ep,ev,re,r,rp)
		local c=e:GetHandler()
	local g=Duel.GetFieldGroup(tp,LOCATION_GRAVE,LOCATION_GRAVE)
	Duel.SendtoDeck(g,nil,2,REASON_EFFECT)
	Duel.ShuffleDeck(tp)
	Duel.ShuffleDeck(1-tp)
end
function c100000951.activatehh2(e,tp,eg,ep,ev,re,r,rp)
			local c=e:GetHandler()
	local g=Duel.GetFieldGroup(tp,LOCATION_ONFIELD,LOCATION_ONFIELD)
	Duel.SendtoDeck(g,nil,2,REASON_EFFECT)
	Duel.ShuffleDeck(tp)
	Duel.ShuffleDeck(1-tp)
end
function c100000951.rfilter(c,att)
	return c:IsAbleToRemoveAsCost() and c:IsCode(100000950)
end
function c100000951.rfilter2(c,att)
	return c:IsAbleToRemoveAsCost() and c:IsCode(100000949)
end
function c100000951.rfilter3(c,att)
	return c:IsAbleToRemoveAsCost() and c:IsCode(100000948)
end
function c100000951.cost(e,tp,eg,ep,ev,re,r,rp,chk)
	if chk==0 then return Duel.IsExistingMatchingCard(c100000951.rfilter,tp,LOCATION_GRAVE,0,1,nil,nil)
		and Duel.IsExistingMatchingCard(c100000951.rfilter2,tp,LOCATION_GRAVE,0,1,nil,nil)
		and Duel.IsExistingMatchingCard(c100000951.rfilter3,tp,LOCATION_GRAVE,0,1,nil,nil)
	end
	Duel.Hint(HINT_SELECTMSG,tp,HINTMSG_REMOVE)
	local g=Duel.SelectMatchingCard(tp,c100000951.rfilter,tp,LOCATION_GRAVE,0,1,1,nil,nil)
	Duel.Hint(HINT_SELECTMSG,tp,HINTMSG_REMOVE)
	local g1=Duel.SelectMatchingCard(tp,c100000951.rfilter2,tp,LOCATION_GRAVE,0,1,1,nil,nil)
	Duel.Hint(HINT_SELECTMSG,tp,HINTMSG_REMOVE)
	local g2=Duel.SelectMatchingCard(tp,c100000951.rfilter3,tp,LOCATION_GRAVE,0,1,1,nil,nil)
	g:Merge(g1)
	g:Merge(g2)
	Duel.Remove(g,POS_FACEUP,REASON_COST)
end
function c100000951.targethh(e,tp,eg,ep,ev,re,r,rp,chk)
	if chk==0 then return true end
	local g=Duel.GetFieldGroup(tp,LOCATION_HAND,LOCATION_HAND)
	Duel.SetOperationInfo(0,CATEGORY_TODECK,g,g:GetCount(),0,0)
end
function c100000951.targethh2(e,tp,eg,ep,ev,re,r,rp,chk)
	if chk==0 then return true end
	local g=Duel.GetFieldGroup(tp,LOCATION_ONFIELD,LOCATION_ONFIELD)
	Duel.SetOperationInfo(0,CATEGORY_TODECK,g,g:GetCount(),0,0)
end
function c100000951.targethh3(e,tp,eg,ep,ev,re,r,rp,chk)
	if chk==0 then return true end
	local g=Duel.GetFieldGroup(tp,LOCATION_GRAVE,LOCATION_GRAVE)
	Duel.SetOperationInfo(0,CATEGORY_TODECK,g,g:GetCount(),0,0)
end
function c100000951.activatehh(e,tp,eg,ep,ev,re,r,rp)
	local c=e:GetHandler()
	local g=Duel.GetFieldGroup(tp,LOCATION_HAND,LOCATION_HAND)
	Duel.SendtoDeck(g,nil,2,REASON_EFFECT)
	Duel.ShuffleDeck(tp)
	Duel.ShuffleDeck(1-tp)
end
function c100000951.cfilter(c)
	return c:IsFaceup() and not c:IsDisabled()
end
function c100000951.target(e,tp,eg,ep,ev,re,r,rp,chk,chkc)
	if chk==0 then return Duel.IsExistingMatchingCard(c100000951.cfilter,tp,0,LOCATION_ONFIELD,1,nil) end
end
function c100000951.negcost(e,tp,eg,ep,ev,re,r,rp,chk)
	if chk==0 then return e:GetHandler():IsAbleToRemoveAsCost() end
	Duel.Remove(e:GetHandler(),POS_FACEUP,REASON_COST)
end
function c100000951.activate2(e,tp,eg,ep,ev,re,r,rp)
local g=Duel.GetMatchingGroup(c100000951.cfilter,tp,0,LOCATION_ONFIELD,nil)
	local tc=g:GetFirst()
	local c=e:GetHandler()
		while tc do
			local e1=Effect.CreateEffect(c)
			e1:SetType(EFFECT_TYPE_SINGLE)
			e1:SetCode(EFFECT_DISABLE)
			e1:SetReset(RESET_EVENT+0x1fe0000+RESET_PHASE+PHASE_END)
			tc:RegisterEffect(e1)
			local e2=Effect.CreateEffect(c)
			e2:SetType(EFFECT_TYPE_SINGLE)
			e2:SetCode(EFFECT_DISABLE_EFFECT)
			e2:SetReset(RESET_EVENT+0x1fe0000+RESET_PHASE+PHASE_END)
			tc:RegisterEffect(e2)
			if tc:IsType(TYPE_TRAPMONSTER) then end
				local e3=Effect.CreateEffect(c)
				e3:SetType(EFFECT_TYPE_SINGLE)
				e3:SetCode(EFFECT_DISABLE_TRAPMONSTER)
				e3:SetReset(RESET_EVENT+0x1fe0000+RESET_PHASE+PHASE_END)
			tc:RegisterEffect(e3)
		tc=g:GetNext()
	end
end
