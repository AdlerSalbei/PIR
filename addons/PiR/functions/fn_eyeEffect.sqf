if (!isServer) exitWith {};
params [ "_unit", "_anim", "_shans"];

while {true} do {
    if ((!alive _unit) or ((damage _unit < 0.251) && !(_unit getVariable ["dam_ignore_injured0",false]))) exitWith {};
    if ((damage _unit) < 0.89) then {
        _unit setDamage ((damage _unit) + (damage _unit)*0.06);

        switch (_shans) do {
            case 10 : {
                _unit setHitPointDamage ["hitBody", 0];

                _unit setHitPointDamage ["hitHands", 0];

                _unit setHitPointDamage ["hitLegs", 0];
            };
            case 9 : {
                _unit setHitPointDamage ["hitHead", 0];

                _unit setHitPointDamage ["hitHands", 0];

                _unit setHitPointDamage ["hitLegs", 0];
            };
            case 7 : {
                _unit setHitPointDamage ["hitHead", 0];

                _unit setHitPointDamage ["hitHands", 0];

                _unit setHitPointDamage ["hitLegs", 0];
            };
            case 5 : {
                _unit setHitPointDamage ["hitHead", 0];

                _unit setHitPointDamage ["hitHands", 0];

                _unit setHitPointDamage ["hitLegs", 0];
            };
            case 3 : {
                _unit setHitPointDamage ["hitHead", 0];

                _unit setHitPointDamage ["hitHands", 0];

                _unit setHitPointDamage ["hitLegs", 0];
            };
            case 1 : {
                _unit setHitPointDamage ["hitHead", 0];

                _unit setHitPointDamage ["hitHands", 0];

                _unit setHitPointDamage ["hitLegs", 0];
            };
            case 0 : {
                _unit setHitPointDamage ["hitHead", 0];

                _unit setHitPointDamage ["hitHands", 0];

                _unit setHitPointDamage ["hitLegs", 0];
            };
            default {};

        };
    };


    if (((damage _unit) > 0.79) && !(_unit getVariable ["dam_ignore_injured0",false]) && (vehicle _unit == _unit)) then {
        _unit setVariable ["dam_ignore_injured0",true];
        _unit removeAllEventHandlers "hitpart";

        if ((_shans - (random 10)) >= 0) then {
            _null = [_unit, _anim, _shans] spawn Crawl;
        } else {
            _null = [_unit, _anim, _shans] spawn Uncondition;
        };
    };

    sleep (8 - (random 4));
};

 _unit setVariable ["dam_ignore_effect0",false];
