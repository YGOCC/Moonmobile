--Rocksaber Dawnbringer
function c96643268.initial_effect(c)
    c:SetSPSummonOnce(96643268)
--    local NoF=Effect.CreateEffect(c)
--    NoF:SetType(EFFECT_TYPE_SINGLE)
--    NoF:SetProperty(EFFECT_FLAG_UNCOPYABLE+EFFECT_FLAG_CANNOT_DISABLE)
--    NoF:SetCode(EFFECT_CANNOT_BE_FUSION_MATERIAL)
--    NoF:SetValue(function(e,c) if not c then return false end return not c:IsSetCard(0xdfa) end)
--    c:RegisterEffect(NoF)
--    local NoS=NoF:Clone()
--    NoS:SetCode(EFFECT_CANNOT_BE_SYNCHRO_MATERIAL)
--    c:RegisterEffect(NoS)
--    local NoX=NoF:Clone()
--    NoX:SetCode(EFFECT_CANNOT_BE_XYZ_MATERIAL)
--    c:RegisterEffect(NoX)
--    local NoL=NoF:Clone()
--    NoL:SetCode(EFFECT_CANNOT_BE_LINK_MATERIAL)
--    c:RegisterEffect(NoL)
    --link procedure
    c:EnableReviveLimit()
    aux.AddLinkProcedure(c,c96643268.mfilter,1)
    --release limit
--    local e0=Effect.CreateEffect(c)
--    e0:SetType(EFFECT_TYPE_SINGLE)
--    e0:SetProperty(EFFECT_FLAG_SINGLE_RANGE)
--    e0:SetRange(LOCATION_MZONE)
--    e0:SetCode(EFFECT_UNRELEASABLE_NONSUM)
--    e0:SetValue(1)
--    c:RegisterEffect(e0)
--    local e1=e0:Clone()
--    e1:SetCode(EFFECT_UNRELEASABLE_SUM)
--    e1:SetValue(c96643268.sumval)
--    c:RegisterEffect(e1)
    --to hand
    local e2=Effect.CreateEffect(c)
    e2:SetDescription(aux.Stringid(96643268,0))
    e2:SetCategory(CATEGORY_TOHAND)
    e2:SetType(EFFECT_TYPE_QUICK_O)
    e2:SetCode(EVENT_FREE_CHAIN)
    e2:SetRange(LOCATION_MZONE)
    e2:SetCountLimit(1,96643268)
    e2:SetHintTiming(0,TIMINGS_CHECK_MONSTER+TIMING_END_PHASE)
    e2:SetCost(c96643268.thcost)
    e2:SetTarget(c96643268.thtg)
    e2:SetOperation(c96643268.thop)
    c:RegisterEffect(e2)
    --special summon
--    local e3=Effect.CreateEffect(c)
--    e3:SetDescription(aux.Stringid(96643268,1))
--    e3:SetCategory(CATEGORY_SPECIAL_SUMMON)
--    e3:SetType(EFFECT_TYPE_SINGLE+EFFECT_TYPE_TRIGGER_O)
--    e3:SetProperty(EFFECT_FLAG_DAMAGE_STEP+EFFECT_FLAG_DELAY)
--    e3:SetCode(EVENT_TO_GRAVE)
--    e3:SetCountLimit(1,96643368)
--    e3:SetTarget(c96643268.sptg)
--    e3:SetOperation(c96643268.spop)
--    c:RegisterEffect(e3)
end
function c96643268.mfilter(c) 
    return c:IsSetCard(0xdfa) and not c:IsCode(96643268)
end
function c96643268.sumval(e,c)
    return not c:IsSetCard(0xdfa)
end
function c96643268.cfilter(c)
    return c:IsFaceup() and c:IsSetCard(0xdfa) and c:IsAbleToGraveAsCost()
end
function c96643268.thfilter(c)
    return c:IsFaceup() and c:IsAbleToHand()
end
function c96643268.thcost(e,tp,eg,ep,ev,re,r,rp,chk)
    if chk==0 then return Duel.IsExistingMatchingCard(c96643268.cfilter,tp,LOCATION_EXTRA,0,1,nil) end
    Duel.Hint(HINT_SELECTMSG,tp,HINTMSG_TOGRAVE)
    local g=Duel.SelectMatchingCard(tp,c96643268.cfilter,tp,LOCATION_EXTRA,0,1,1,nil)
    Duel.SendtoGrave(g,REASON_COST)
end
function c96643268.thtg(e,tp,eg,ep,ev,re,r,rp,chk)
    if chk==0 then return true end
    Duel.SetOperationInfo(0,CATEGORY_TOHAND,nil,1,0,LOCATION_ONFIELD)
end
function c96643268.thop(e,tp,eg,ep,ev,re,r,rp)
    Duel.Hint(HINT_SELECTMSG,tp,HINTMSG_RTOHAND)
    local g=Duel.SelectMatchingCard(tp,c96643268.thfilter,tp,LOCATION_ONFIELD,LOCATION_ONFIELD,1,1,nil)
    if g:GetCount()>0 then
        Duel.SendtoHand(g,nil,REASON_EFFECT)
    end
end
function c96643268.filter(c,e,tp)
    return c:IsSetCard(0xdfa) and c:IsType(TYPE_PENDULUM) and c:IsCanBeSpecialSummoned(e,0,tp,false,false)
end
function c96643268.sptg(e,tp,eg,ep,ev,re,r,rp,chk)
    if chk==0 then return Duel.GetLocationCount(tp,LOCATION_MZONE)>0 
        and Duel.IsExistingMatchingCard(c96643268.filter,tp,LOCATION_GRAVE,0,1,nil,e,tp) end
    Duel.SetOperationInfo(0,CATEGORY_SPECIAL_SUMMON,nil,1,tp,LOCATION_GRAVE)
end
function c96643268.spop(e,tp,eg,ep,ev,re,r,rp)
    if Duel.GetLocationCount(tp,LOCATION_MZONE)<=0 then return end
    Duel.Hint(HINT_SELECTMSG,tp,HINTMSG_SPSUMMON)
    local g=Duel.SelectMatchingCard(tp,c96643268.filter,tp,LOCATION_GRAVE,0,1,1,nil,e,tp)
    if g:GetCount()>0 then
        Duel.SpecialSummon(g,0,tp,tp,false,false,POS_FACEUP)
    end
end