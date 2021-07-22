
function FixUndying_setDamageAndHealPlayer(player: W3PlayerWitcher, out action: W3DamageAction) {
  var resulting_health: float;
  var healing_factor: float;

  healing_factor = CalculateAttributeValue(
    player.GetSkillAttributeValue(S_Sword_s18, 'healing_factor', false, true)
  );

  healing_factor *= player.GetStatMax(BCS_Vitality);
  healing_factor *= player.GetStat(BCS_Focus);
  healing_factor *= 1 + CalculateAttributeValue(
    player.GetSkillAttributeValue(S_Sword_s18, 'healing_bonus', false, true)
  ) * (player.GetSkillLevel(S_Sword_s18) - 1);

  resulting_health = MinF(player.GetStatMax(BCS_Vitality), player.GetStat(BCS_Vitality) + healing_factor);

  // if player was still going to die from the hit even after the undying heal
  if (resulting_health <= action.processedDmg.vitalityDamage) {
    // still giving some damage to proc some effects or potential weird coding
    action.processedDmg.vitalityDamage = 50;
    player.ForceSetStat(BCS_Vitality, 100);
  }
  else {
    player.ForceSetStat(BCS_Vitality, resulting_health);
  }
}