--Aghast Primadonna (scripter: Elma✓)function c12593475.initial_effect(c)	c:EnableReviveLimit()	--negate	local e1=Effect.CreateEffect(c)	e1:SetDescription(aux.Stringid(12593475,0))	e1:SetCategory(CATEGORY_DISABLE)	e1:SetType(EFFECT_TYPE_QUICK_O)	e1:SetCode(EVENT_FREE_CHAIN)	e1:SetProperty(EFFECT_FLAG_CARD_TARGET)	e1:SetRange(LOCATION_MZONE)	e1:SetHintTiming(0,TIMINGS_CHECK_MONSTER)	e1:SetCountLimit(1,12593475)	e1:SetTarget(c12593475.target)	e1:SetOperation(c12593475.operation)	c:RegisterEffect(e1)endfunction c12593475.target(e,tp,eg,ep,ev,re,r,rp,chk,chkc)	if chkc then return chkc:IsControler(1-tp) and chkc:IsOnField() and aux.disfilter1(chkc,true) end	if chk==0 then return Duel.IsExistingTarget(aux.disfilter1,tp,0,LOCATION_ONFIELD,1,nil,true) end	Duel.Hint(HINT_SELECTMSG,tp,HINTMSG_FACEUP)	local g=Duel.SelectTarget(tp,aux.disfilter1,tp,0,LOCATION_ONFIELD,1,1,nil,true)	Duel.SetOperationInfo(0,CATEGORY_DISABLE,g,1,0,0)endfunction c12593475.operation(e,tp,eg,ep,ev,re,r,rp)	local c=e:GetHandler()	local tc=Duel.GetFirstTarget()	if tc:IsFaceup() and (not tc:IsDisabled() or tc:IsType(TYPE_TRAPMONSTER)) and tc:IsRelateToEffect(e) then		Duel.NegateRelatedChain(tc,RESET_TURN_SET)		local e1=Effect.CreateEffect(c)		e1:SetType(EFFECT_TYPE_SINGLE)		e1:SetProperty(EFFECT_FLAG_CANNOT_DISABLE)		e1:SetCode(EFFECT_DISABLE)		e1:SetReset(RESET_EVENT+RESETS_STANDARD+RESET_PHASE+PHASE_END)		tc:RegisterEffect(e1)		local e2=Effect.CreateEffect(c)		e2:SetType(EFFECT_TYPE_SINGLE)		e2:SetProperty(EFFECT_FLAG_CANNOT_DISABLE)		e2:SetCode(EFFECT_DISABLE_EFFECT)		e2:SetValue(RESET_TURN_SET)		e2:SetReset(RESET_EVENT+RESETS_STANDARD+RESET_PHASE+PHASE_END)		tc:RegisterEffect(e2)		if tc:IsType(TYPE_TRAPMONSTER) then			local e3=Effect.CreateEffect(c)			e3:SetType(EFFECT_TYPE_SINGLE)			e3:SetProperty(EFFECT_FLAG_CANNOT_DISABLE)			e3:SetCode(EFFECT_DISABLE_TRAPMONSTER)			e3:SetReset(RESET_EVENT+RESETS_STANDARD+RESET_PHASE+PHASE_END)			tc:RegisterEffect(e3)		end	endend