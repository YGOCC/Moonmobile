--Ruu, Restorer of Engraved Armaments
--Script by XGlitchy30
function c36541446.initial_effect(c)
	--equip
	local e1=Effect.CreateEffect(c)
	e1:SetDescription(aux.Stringid(36541446,0))
	e1:SetCategory(CATEGORY_EQUIP)
	e1:SetType(EFFECT_TYPE_SINGLE+EFFECT_TYPE_TRIGGER_O)
	e1:SetProperty(EFFECT_FLAG_DAMAGE_STEP+EFFECT_FLAG_DELAY)
	e1:SetCode(EVENT_SUMMON_SUCCESS)
	e1:SetCountLimit(1,36541446)
	e1:SetTarget(c36541446.eqtg)
	e1:SetOperation(c36541446.eqop)
	c:RegisterEffect(e1)
	local e2=Effect.CreateEffect(c)
	e2:SetCategory(CATEGORY_EQUIP)
	e2:SetType(EFFECT_TYPE_QUICK_O)
	e2:SetProperty(EFFECT_FLAG_DELAY)
	e2:SetRange(LOCATION_MZONE)
	e2:SetCode(EVENT_CHAINING)
	e2:SetCountLimit(1,36541446)
	e2:SetCondition(c36541446.chain1)
	e2:SetTarget(c36541446.eqtg)
	e2:SetOperation(c36541446.eqop)
	c:RegisterEffect(e2)
	local e3=Effect.CreateEffect(c)
	e3:SetCategory(CATEGORY_EQUIP)
	e3:SetType(EFFECT_TYPE_FIELD+EFFECT_TYPE_TRIGGER_O)
	e3:SetProperty(EFFECT_FLAG_DELAY)
	e3:SetRange(LOCATION_MZONE)
	e3:SetCode(EVENT_CHAIN_SOLVED)
	e3:SetCountLimit(1,36541446)
	e3:SetCondition(c36541446.chain2)
	e3:SetTarget(c36541446.eqtg)
	e3:SetOperation(c36541446.eqop)
	c:RegisterEffect(e3)
	local e4=e1:Clone()
	e4:SetCode(EVENT_FLIP_SUMMON_SUCCESS)
	c:RegisterEffect(e4)
	local e5=e1:Clone()
	e5:SetCode(EVENT_SPSUMMON_SUCCESS)
	c:RegisterEffect(e5)
end
--filters
function c36541446.fixequip(c,ec)
	return c:IsSetCard(0x824a) and c:GetEquipTarget()==nil or (c:IsSetCard(0x824a) and c:GetEquipTarget()~=nil and c:GetEquipTarget()~=ec)
end
function c36541446.rtfilter(c)
	return c:IsSetCard(0x8ea2) and c:IsAbleToHand()
end
--equip
function c36541446.chain1(e,tp,eg,ep,ev,re,r,rp)
	local c=e:GetHandler()
	local ec=c:GetEquipTarget()
	return re:GetHandler():IsSetCard(0xba43) and rp==tp
		and (re:GetHandler():GetFlagEffect(36541431)>0 
				or re:GetHandler():GetFlagEffect(36541432)>0
					or re:GetHandler():GetFlagEffect(36541433)>0 
						or re:GetHandler():GetFlagEffect(36541434)>0
							or re:GetHandler():GetFlagEffect(36541435)>0 
								or re:GetHandler():GetFlagEffect(36541436)>0)
end
function c36541446.chain2(e,tp,eg,ep,ev,re,r,rp)
	local c=e:GetHandler()
	local ec=c:GetEquipTarget()
	return re:GetHandler():IsSetCard(0xba43) and rp==tp
		and (re:GetHandler():GetFlagEffect(36540431)>0 
				or re:GetHandler():GetFlagEffect(36540432)>0
					or re:GetHandler():GetFlagEffect(36540433)>0 
						or re:GetHandler():GetFlagEffect(36540434)>0
							or re:GetHandler():GetFlagEffect(36540435)>0 
								or re:GetHandler():GetFlagEffect(36540436)>0)
end
function c36541446.eqtg(e,tp,eg,ep,ev,re,r,rp,chk)
	if chk==0 then return Duel.GetLocationCount(tp,LOCATION_SZONE)>0
		and Duel.IsExistingMatchingCard(c36541446.fixequip,tp,LOCATION_ONFIELD+LOCATION_HAND,0,1,e:GetHandler(),e:GetHandler()) end
	Duel.SetOperationInfo(0,CATEGORY_EQUIP,nil,1,tp,LOCATION_ONFIELD+LOCATION_HAND)
end
function c36541446.eqlimit(e,c)
	return c==e:GetLabelObject()
end
function c36541446.eqop(e,tp,eg,ep,ev,re,r,rp)
	local c=e:GetHandler()
	Duel.Hint(HINT_SELECTMSG,tp,HINTMSG_EQUIP)
	local eqp=Duel.SelectMatchingCard(tp,c36541446.fixequip,tp,LOCATION_ONFIELD+LOCATION_HAND,0,1,1,c,c)
	local eq=eqp:GetFirst()
	if eq then
		if c:IsFaceup() then
			if Duel.Equip(tp,eq,c,true) then
				--Add Equip limit
				local e1=Effect.CreateEffect(c)
				e1:SetType(EFFECT_TYPE_SINGLE)
				e1:SetCode(EFFECT_EQUIP_LIMIT)
				e1:SetProperty(EFFECT_FLAG_COPY_INHERIT+EFFECT_FLAG_OWNER_RELATE)
				e1:SetReset(RESET_EVENT+0x1fe0000)
				e1:SetValue(c36541446.eqlimit)
				e1:SetLabelObject(c)
				eq:RegisterEffect(e1)
				if Duel.IsExistingMatchingCard(Card.IsAbleToDeck,tp,LOCATION_HAND,0,1,nil) and Duel.IsExistingMatchingCard(c36541446.rtfilter,tp,LOCATION_GRAVE,0,1,nil) then
					if Duel.SelectYesNo(tp,aux.Stringid(36541446,1)) then
						Duel.Hint(HINT_SELECTMSG,tp,HINTMSG_TODECK)
						local rt=Duel.SelectMatchingCard(tp,Card.IsAbleToDeck,tp,LOCATION_HAND,0,1,1,nil)
						if rt:GetCount()>0 then
							Duel.SendtoDeck(rt,nil,0,REASON_EFFECT)
							Duel.BreakEffect()
							Duel.Hint(HINT_SELECTMSG,tp,HINTMSG_TOHAND)
							local th=Duel.SelectMatchingCard(tp,c36541446.rtfilter,tp,LOCATION_GRAVE,0,1,1,nil)
							if th:GetCount()>0 then
								Duel.SendtoHand(th,nil,REASON_EFFECT)
								Duel.ConfirmCards(1-tp,th)
							end
						end
					end
				end
			else Duel.SendtoGrave(eqp,REASON_EFFECT) end
		end
	end
end