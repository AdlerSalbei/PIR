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

		If (alive _unit) then {
		 _unit removeWeaponGlobal (primaryWeapon _unit);
		 _unit removeWeaponGlobal (secondaryWeapon _unit);
		 _unit removeWeaponGlobal (handgunWeapon _unit);
 		 _magsremove = magazines _unit;
		 {_unit removeMagazineGlobal _x} forEach magazines _unit;

		 [ _unit ] remoteExec [ "dam_fnc_wake", 2 ];


		 sleep 5.033;
			If (alive _unit) then {
			 [_unit, "ApanPpneMstpSnonWnonDnon"] remoteExec ["switchMove", 0];
 
			 sleep 2;

			 _dis = (10 + random 35);  
			 _Pos = getPos _unit;

   
			 _timer = (time + 25 + (random 20));   

	while {true}                  
do {
			 IF ((_unit distance _Pos >= _dis) or (!alive _unit) or (time >= _timer)) exitWith {};	 
			IF (( AnimationState _unit != "ApanPpneMstpSnonWnonDnon") && ( AnimationState _unit != "ApanPpneMstpSnonWnonDnon_G01") && ( AnimationState _unit != "ApanPpneMstpSnonWnonDnon_G02") && ( AnimationState _unit != "ApanPpneMstpSnonWnonDnon_G03") && ( AnimationState _unit != "ApanPpneMsprSnonWnonDf") && ( AnimationState _unit != "ApanPpneMrunSnonWnonDb") && ( AnimationState _unit != "ApanPpneMrunSnonWnonDbl") && ( AnimationState _unit != "ApanPpneMrunSnonWnonDbr") && ( AnimationState _unit != "ApanPpneMrunSnonWnonDf") && ( AnimationState _unit != "ApanPpneMrunSnonWnonDfl") && ( AnimationState _unit != "ApanPpneMrunSnonWnonDfr") && ( AnimationState _unit != "ApanPpneMrunSnonWnonDl") && ( AnimationState _unit != "ApanPpneMrunSnonWnonDr")) then {
			_unit playAction "Down";
			};
	 sleep 0.5;
	};

//__________________________________________________________Выход_______________________________________________________________			 
			 
			IF (_numberOfKits > 0 ) then {
				for "_i" from 1 to _numberOfKits do { _unit addItem "FirstAidKit"};
			};


				If ((((_shans - (random 10)) >=0) && (alive _unit))) then {
					
					 	 [_unit] joinSilent _unitGrp;

						 _null = [_unit, _anim, _shans] spawn Uncondition0;
					  sleep 8;

				} Else {

					If ((((_shans - (random 10)) >=0) && (alive _unit))) then {

					 _unit setdamage 1;

						IF (_shans == 10)  then {
						 _unit setHitPointDamage ["hitBody", 0];

						 _unit setHitPointDamage ["hitHands", 0];

						 _unit setHitPointDamage ["hitLegs", 0];
						};


						IF ((_shans == 7) or (_shans == 9))  then {
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


					 _unit setVariable ["dam_ignore_injured0",false];
				 
					 sleep 3;

						

					} Else {

					 [ _unit ] remoteExec [ "dam_fnc_setunconscious", 2 ];
						waitUntil { sleep 0.1; ((AnimationState _unit == "UnconsciousReviveDefault") or (!alive _unit)) 
						};	
					 [ _unit ] remoteExec [ "dam_fnc_wake", 2 ];
					 _unit setVariable ["dam_ignore_injured0",false];

					 [_unit] joinSilent _unitGrp;
					 _unit addMPEventHandler ["MPHit", {(_this select 0) spawn PiR0}];
					};
				};




			};

  			 {_unit addMagazine [_x, 1]} forEach _magsremove;
			 sleep 0.5;
			If (str _sWeapon != "") then {
			 _unit addWeaponGlobal _sWeapon;
  			 {_unit addsecondaryWeaponItem _x} forEach _sWItems;
			 };
			If (str _pWeapon != "") then {
			 _unit addWeaponGlobal _pWeapon;
  			 {_unit addprimaryWeaponItem _x} forEach _pWItems;
			 };
			If (str _hWeapon != "") then {
			 _unit addWeaponGlobal _hWeapon;
  			 {_unit addhandgunItem _x} forEach _hWItems;
			 };

		
		};

	};

	If (!alive _unit) then {
	 _unit setVariable ["dam_ignore_injured0",false]; 
	};
	
//_____________________________________________________________________________________________________________________________________	