	--created and scripted by rising phoenix
function c100000740.initial_effect(c)
	--activate
	local e1=Effect.CreateEffect(c)
	e1:SetCategory(CATEGORY_SPECIAL_SUMMON)
	e1:SetType(EFFECT_TYPE_ACTIVATE)
	e1:SetCode(EVENT_FREE_CHAIN)
	e1:SetProperty(EFFECT_FLAG_CARD_TARGET)
	e1:SetTarget(c100000740.target)
	e1:SetOperation(c100000740.activate)
	c:RegisterEffect(e1)
end
function c100000740.cfilter(c,tc)
	return c:IsSetCard(0x767) and c:IsSynchroSummonable(tc)
end
function c100000740.spfilter(c,e,tp)
	return c:IsCanBeSpecialSummoned(e,182,tp,false,false)
		and Duel.IsExistingMatchingCard(c100000740.cfilter,tp,LOCATION_EXTRA,0,1,nil,c)
end
function c100000740.target(e,tp,eg,ep,ev,re,r,rp,chk,chkc)
	if chkc then return chkc:IsLocation(LOCATION_GRAVE) and chkc:IsControler(tp) and c100000740.spfilter(chkc,e,tp) end
	if chk==0 then return Duel.IsPlayerCanSpecialSummonCount(tp,2)
		and Duel.GetLocationCount(tp,LOCATION_MZONE)>0
		and Duel.IsExistingTarget(c100000740.spfilter,tp,LOCATION_GRAVE,0,1,nil,e,tp) end
	Duel.Hint(HINT_SELECTMSG,tp,HINTMSG_SPSUMMON)
	local g=Duel.SelectTarget(tp,c100000740.spfilter,tp,LOCATION_GRAVE,0,1,1,nil,e,tp)
	Duel.SetOperationInfo(0,CATEGORY_SPECIAL_SUMMON,g,2,tp,LOCATION_EXTRA)
end
function c100000740.activate(e,tp,eg,ep,ev,re,r,rp)
	local c=e:GetHandler()
	local tc=Duel.GetFirstTarget()
	if tc:IsRelateToEffect(e) and Duel.SpecialSummonStep(tc,182,tp,tp,false,false,POS_FACEUP) then
		Duel.SpecialSummonComplete()
		local g=Duel.GetMatchingGroup(c100000740.cfilter,tp,LOCATION_EXTRA,0,nil,tc)
		if g:GetCount()>0 then
			Duel.Hint(HINT_SELECTMSG,tp,HINTMSG_SPSUMMON)
			local sg=g:Select(tp,1,1,nil)
			Duel.SynchroSummon(tp,sg:GetFirst(),tc)
		end
	end
end
