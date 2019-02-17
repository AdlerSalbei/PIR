if (!isServer) exitWith {}; 

_unit = (_this select 0);
_anim = (_this select 1);
_shans = (_this select 2);

private [ "_unit", "_anim", "_shans", "_unitGrp", "_unitGrpPR", "_pWeapon", "_sWeapon", "_hWeapon", "_magsremove", "_unitStance", "_dis", "_Pos", "_timer","_numberOfKits", "_pWItems", "_sWItems", "_hWItems"];    

_unitGrp = group _unit;
_unitGrpPR = str side group _unit;
_unitStance = stance _unit;

	if  (alive _unit) then {

	 _numberOfKits = {"FirstAidKit" == _x} count (items _unit);	
     _unit removeItems "firstaidkit";	 
     [ _unit ] remoteExec [ "dam_fnc_setunconscious", 2 ];
	 [_unit] joinSilent grpNull;
 
	 _pWeapon = primaryWeapon _unit;
	 _sWeapon = secondaryWeapon _unit;
	 _hWeapon = handgunWeapon _unit;	
	 _pWItems = primaryWeaponItems _unit;
	 _sWItems = secondaryWeaponItems _unit;				
	 _hWItems = handgunItems _unit;				
				
				
				
	 waitUntil { sleep 0.1; ((AnimationState _unit == "UnconsciousReviveDefault") or (!alive _unit)) };

		if (alive _unit) then {
		 _unit removeWeaponGlobal (primaryWeapon _unit);
		 _unit removeWeaponGlobal (secondaryWeapon _unit);
		 _unit removeWeaponGlobal (handgunWeapon _unit);
 		 _magsremove = magazines _unit;
		 {_unit removeMagazineGlobal _x} forEach magazines _unit;

		 [ _unit ] remoteExec [ "dam_fnc_wake", 2 ];


		 sleep 5.033;
			if (alive _unit) then {
			 [_unit, "ApanPpneMstpSnonWnonDnon"] remoteExec ["switchMove", 0];
 
			 sleep 2;
			 _unit setUnitPosWeak "DOWN";
			 if ("CROUCH" ==  _unitStance ) then {
				 _unit  setUnitPos "AUTO";
				};
			 _unit setBehaviour "CARELESS";
			 _dis = (10 + random 35);  
			 _Pos = [_unit, _dis,(((getDir _unit)-25) + (random 50))] call BIS_fnc_relPos;

   
			 _timer = (time + 25 + (random 20));   
			 _unit  domove _Pos;
			 _unit setSpeedMode "FULL";	
			 sleep 2;
	while {true}                  
do {
			 if ((_unit distance _Pos < 5 ) or (!alive _unit) or (time >= _timer)) exitWith {};	 
			if (( AnimationState _unit != "ApanPpneMstpSnonWnonDnon") && ( AnimationState _unit != "ApanPpneMstpSnonWnonDnon_G01") && ( AnimationState _unit != "ApanPpneMstpSnonWnonDnon_G02") && ( AnimationState _unit != "ApanPpneMstpSnonWnonDnon_G03") && ( AnimationState _unit != "ApanPpneMsprSnonWnonDf") && ( AnimationState _unit != "ApanPpneMrunSnonWnonDb") && ( AnimationState _unit != "ApanPpneMrunSnonWnonDbl") && ( AnimationState _unit != "ApanPpneMrunSnonWnonDbr") && ( AnimationState _unit != "ApanPpneMrunSnonWnonDf") && ( AnimationState _unit != "ApanPpneMrunSnonWnonDfl") && ( AnimationState _unit != "ApanPpneMrunSnonWnonDfr") && ( AnimationState _unit != "ApanPpneMrunSnonWnonDl") && ( AnimationState _unit != "ApanPpneMrunSnonWnonDr")) then {
			_unit playAction "Down";
			};
	 sleep 0.5;
	};

			 dostop _unit;

//__________________________________________________________Выход_______________________________________________________________			 
			 

			if (_numberOfKits > 0 ) then {
				for "_i" from 1 to _numberOfKits do { _unit addItem "FirstAidKit"};
			};


			if ((((_shans - (random 10)) >=0) && (alive _unit))) then {

					 	 [_unit] joinSilent _unitGrp;
					 _null = [_unit, _anim] spawn Uncondition;
					  sleep 8;

				} else {

					if ((((_shans - (random 10)) >=0) && (alive _unit))) then {

					 _unit setdamage 1;

						if (_shans == 10)  then {
						 _unit setHitPointDamage ["hitBody", 0];

						 _unit setHitPointDamage ["hitHands", 0];

						 _unit setHitPointDamage ["hitLegs", 0];
						};


						if ((_shans == 7) or (_shans == 9))  then {
						 _unit setHitPointDamage ["hitHead", 0];

						 _unit setHitPointDamage ["hitHands", 0];

						 _unit setHitPointDamage ["hitLegs", 0];
						};

						if ((_shans == 1) or (_shans == 3)) then {
						 _unit setHitPointDamage ["hitHead", 0];

						 _unit setHitPointDamage ["hitBody", 0];

						 _unit setHitPointDamage ["hitLegs", 0];
						};

						if (_shans == 5) then {
						 _unit setHitPointDamage ["hitHead", 0];

						 _unit setHitPointDamage ["hitBody", 0];

						 _unit setHitPointDamage ["hitHands", 0];
						};					 
					 
					 _unit setVariable ["dam_ignore_injured0",false];
				 
					 sleep 3;

						

					} else {

					 [ _unit ] remoteExec [ "dam_fnc_setunconscious", 2 ];
						waitUntil { sleep 0.1; ((AnimationState _unit == "UnconsciousReviveDefault") or (!alive _unit)) 
						};	
					 [ _unit ] remoteExec [ "dam_fnc_wake", 2 ];
					 _unit setVariable ["dam_ignore_injured0",false];
					 _unit setUnitPos "AUTO";
					 _unit setCombatMode "RED";
					 _unit setBehaviour "COMBAT";

					 [_unit] joinSilent _unitGrp;
					 _unit addMPEventHandler ["MPHit", {(_this select 0) spawn PiR}];
					};
				};




			};

  			 {_unit addMagazine [_x, 1]} forEach _magsremove;
			 sleep 0.5;
			if (str _sWeapon != "") then {
			 _unit addWeaponGlobal _sWeapon;
  			 {_unit addsecondaryWeaponItem _x} forEach _sWItems;
			 };
			if (str _pWeapon != "") then {
			 _unit addWeaponGlobal _pWeapon;
  			 {_unit addprimaryWeaponItem _x} forEach _pWItems;
			 };
			if (str _hWeapon != "") then {
			 _unit addWeaponGlobal _hWeapon;
  			 {_unit addhandgunItem _x} forEach _hWItems;
			 };

		
		};

	};

	if (!alive _unit) then {
	 _unit setVariable ["dam_ignore_injured0",false]; 
	};
	
//_____________________________________________________________________________________________________________________________________	


