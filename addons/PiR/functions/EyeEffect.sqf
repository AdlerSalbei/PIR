if (!isServer) exitWith {}; 

  	 _unit = _this select 0;
	 _anim = _this select 1;
	 _shans = _this select 2;

	private [ "_unit", "_anim", "_shans"];    






	while {true}                  
do {

If ((!alive _unit) or ((damage _unit < 0.251) && !(_unit getVariable ["dam_ignore_injured0",false]))) exitWith {};
	IF ((damage _unit) < 0.89) then {
	 _unit setDamage ((damage _unit) + (damage _unit)*0.06);
	 
		IF (_shans == 10)  then {
		 _unit setHitPointDamage ["hitBody", 0];

		 _unit setHitPointDamage ["hitHands", 0];

		 _unit setHitPointDamage ["hitLegs", 0];
		};


		IF ((_shans == 7) or (_shans == 9) or (_shans == 0))  then {
		 _unit setHitPointDamage ["hitHead", 0];

		 _unit setHitPointDamage ["hitHands", 0];

		 _unit setHitPointDamage ["hitLegs", 0];
		};

		IF ((_shans == 1) or (_shans == 3)) then {
		 _unit setHitPointDamage ["hitHead", 0];

		 _unit setHitPointDamage ["hitBody", 0];

		 _unit setHitPointDamage ["hitLegs", 0];
		};

		IF (_shans == 5) then {
		 _unit setHitPointDamage ["hitHead", 0];

		 _unit setHitPointDamage ["hitBody", 0];

		 _unit setHitPointDamage ["hitHands", 0];
		};
	 
	};


IF (((damage _unit) > 0.79) && !(_unit getVariable ["dam_ignore_injured0",false]) && (vehicle _unit == _unit)) then {

		_unit setVariable ["dam_ignore_injured0",true];	
		_unit 	removeAllEventHandlers "hitpart";

	IF ((_shans - (random 10)) >=0) then {
	 _null = [_unit, _anim, _shans] spawn Crawl;	
	} ELSE {
	 _null = [_unit, _anim, _shans] spawn Uncondition;
	};
};

sleep (8 - (random 4));


};

 		_unit setVariable ["dam_ignore_effect0",false];