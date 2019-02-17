if (!isServer) exitWith {}; 




_unit = (_this select 0);
_anim = (_this select 1);
_shans = (_this select 2);


private ["_unit","_anim", "_shans", "_Pos","_dummy","_nearestunits","_dragger","_emptyHouse","_nearesthouses",
"_houseList","_randomHouse","_dis", "_randomSmoke", "_unitGrp","_draggerGrp","_ls","_future","_nearPlayers","_isFriendly","_bloodtime","_tashit","_statys","_dummypos","_unitGrpPR","_pos0","_dummyV","_numberOfKits"];

_unitGrp = group _unit;
_unitGrpPR = str side group _unit;
_bloodtime = (time +  130 + random 65);
_statys = 1;
_pos0 = [0,0,0];

	 _numberOfKits = {"FirstAidKit" == _x} count (items _unit);
     _unit removeItems "firstaidkit";
 	 _magsremove = magazines _unit;
	 {_unit removeMagazineGlobal _x} forEach magazines _unit;
	 
	 [ _unit ] remoteExec [ "dam_fnc_setunconscious", 2 ];	 
	 _unit playMove _anim; 
	 

	 
	 
//__________________Добавляем действие на перетаскивание для игрока__________________________________________________	 
	 
	 

	 
[_unit, 
[
    "<img size='3'  image='PiR\Icons\ruka_CA.paa'/>", 
    {

		
		_unit = (_this select 0);
		_dragger = (_this select 1);
	 _numberOfKits = {"FirstAidKit" == _x} count (items _dragger); 
	 _dragger removeItems "FirstAidKit";	
	 _unit setVariable ["dam_player_lecit0",true];
     _unit setVariable ["dam_uncondition_injured0",true];
	 
	 [ _unit ] remoteExec [ "dam_fnc_wake", 2 ];
	  _dragger playAction "grabDrag";
	  sleep 0.1;
	  [_unit, "AinjPpneMrunSnonWnonDb"] remoteExec ["switchMove", 0];

	_unit attachTo [_dragger, [0, 1.1, 0.05]]; 
	[_unit, 180] remoteExec ["setDir", 0, false];

sleep 2; 

        waituntil { sleep 0.1; ((inputAction "MoveBack" != 1) or (!alive _unit) or (!alive _dragger) or (_dragger getVariable ["dam_ignore_injured0",false]))
		};

		
		
			if ((!alive _dragger) or (_dragger getVariable ["dam_ignore_injured0",false])) then {	

			detach _unit;
		 [[_unit,""] remoteExec ["switchMove"]]; 
		 [_unit] remoteExec [ "dam_fnc_setunconscious", 2 ];

		 


		};

		if (!alive _unit) then {

		detach _unit;
					 [[_dragger,"AcinPknlMstpSrasWrflDnon_AmovPknlMstpSrasWrflDnon"] remoteExec ["playMove"]]; 


		};
		
		
		
		
				if (inputAction "MoveBack" != 1) then {
		
					 detach _unit;
					 [[_dragger,"AcinPknlMstpSrasWrflDnon_AmovPknlMstpSrasWrflDnon"] remoteExec ["playMove"]]; 
					 [[_unit,"AinjPpneMrunSnonWnonDb_release"] remoteExec ["playMove"]];
					 sleep 1;
					 [_unit] remoteExec [ "dam_fnc_setunconscious", 2 ];					 


				};							 
			if (_numberOfKits > 0 ) then {
				for "_i" from 1 to _numberOfKits do { _dragger addItem "FirstAidKit"};
			};
		sleep 2;
		 _unit setVariable ["dam_player_lecit0",false];		
		 _unit setVariable ["dam_uncondition_injured0",false];


	},
    [],
    1.5, 
    true, 
    true, 
    "",
    "(_this distance _target < 2) && !(_target getVariable ['dam_uncondition_injured0',false]) && !(_target getVariable ['dam_player_lecit0',false]) && !(_this getVariable ['dam_ignore_injured0',false])", // _target, _this, _originalTarget
    2,
    true,
    "",
    ""
]	 
] remoteExec ["addAction",0];
	 
	 
	 
	 
	 
	 
	 
	 
	 
//________________________________________________________________________________________________________________________________	 

//__________________Добавляем действие на лечение для игрока__________________________________________________

[
	_unit,											// Object the action is attached to
	"Оказать помощь",										// Title of the action
	"PiR\Icons\krest_CA.paa",	// Иконка действия
	"PiR\Icons\estpuls_CA.paa",	// Иконка прогресса
	"(_this distance _target < 2) && !(_target getVariable ['dam_uncondition_injured0',false]) && !(_this getVariable ['dam_ignore_injured0',false]) && (({'FirstAidKit' == _x} count (items _this) > 0) or ({'Medikit' == _x} count (items _this) > 0))",						// Условие к созданию действия
	"(_this distance _target < 2) && ((inputAction 'Action') > 0) && (alive _this) && (alive _target) && !(_this getVariable ['dam_ignore_injured0',false])",						// Условие на выполнение действия
	{// Старт
	
	_unit = (_this select 0);
	_dragger = (_this select 1);
	


	
						 _dragger playmove "AinvPknlMstpSnonWrflDr_medic4_old";

	_unit setVariable ["dam_player_lecit0",true];



	
	
	
	
	},												
	{//  На каждое деление
	
		 _dragger = (_this select 1);
								if (AnimationState _dragger == "AinvPknlMstpSnonWrflDnon_medicEnd" or  AnimationState _dragger == "AinvPknlMstpSnonWrflDr_medic0S" ) then {
						 	 _dragger playmove (selectRandom ["AinvPknlMstpSnonWrflDr_medic0_old", "AinvPknlMstpSnonWrflDr_medic1_old", "AinvPknlMstpSnonWrflDr_medic2_old", "AinvPknlMstpSnonWrflDr_medic3_old", "AinvPknlMstpSnonWrflDr_medic4_old", "AinvPknlMstpSnonWrflDr_medic5_old"]);	
							};

	
	},													
	{// Финиш 
	
     _unit = (_this select 0);
	 _dragger = (_this select 1);

	 [[_dragger,"AinvPknlMstpSnonWrflDnon_medicEnd"] remoteExec ["switchMove"]];

	 _unit setDamage 0;
	 _unit setVariable ["dam_uncondition_injured0",true];
	 [ _unit ] remoteExec [ "dam_fnc_wake", 2 ];
	 	 _unit setVariable ["dam_conec_istorii0",true];
	 [[_unit,"UnconsciousOutProne"] remoteExec ["switchMove"]]; 

		if ({"Medikit" == _x} count (items _dragger) == 0) then {
		 _dragger removeItem "FirstAidKit";
		};
	 sleep 2;
	 _unit setVariable ["dam_player_lecit0",false];
	 
	},
	{// Прервано

	 _unit = (_this select 0);
	 _dragger = (_this select 1);

	if ((_unit distance _dragger) < 2) then { 
	 [[_dragger,"AinvPknlMstpSnonWrflDnon_medicEnd"] remoteExec ["switchMove"]];	
	};

	 sleep 2;
	 _unit setVariable ["dam_player_lecit0",false];
		 
	},										
	[],													// Arguments passed to the scripts as _this select 3
	(20 + (random 15)),													// Action duration [s]
	4,													// Priority
	true,												// Remove on completion
	true												// Show in unconscious state 
] remoteExec ["BIS_fnc_holdActionAdd", 0, _unit];	// MP compatible implementation



//________________________________________________________________________________________________________________________________





	 
/////////////////// Основной цикл ////////////////////////////////////////
while {true}                  
do {

//__________________Проверка на выход___________________________________________________

	if (_unit getVariable ["dam_conec_istorii0",false]) exitWith {
	
	 _unit enableAI "ANIM";
	 _unit setUnitPos "AUTO";
	 sleep 0.1;
	 _unit enableAI "FSM";
	 _unit setCombatMode "RED";	
	 _unit setBehaviour "COMBAT";	
	 [_unit] joinSilent _unitGrp;
	 { _unit reveal _x; } forEach allUnits;	
	 _unit addMPEventHandler ["MPHit", {_this spawn PiR}];
	};
//______________________________________________________________________________________

//__________________ Проигрывание анимаций в бессознательном____________________________
	if (_statys == 1) then {

	 _null = [_unit, _anim] spawn UnconditionAnim;
		
	};

//______________________________________________________________________________________	
	
 _statys = 0;
 _tashit = 0;
 
 sleep 5 + (random 10);

 
 //__________________Ищем потаскуна_____________________________________________________
	while {true}                  
    do {

		if ((!alive _unit) or (_tashit == 1) or (_unit getVariable ["dam_conec_istorii0",false]) or (time >= _bloodtime)) exitWith {
		};


     _nearestunits = _unit nearEntities ["CAManBase", 50];

     _nearPlayers = 0; 
        { 
        if ((_x distance _unit) <= 50) then 
            { 
             _nearPlayers = _nearPlayers + 1;                                  
            }; 
        } forEach allPlayers;


        if ((count _nearestunits) - _nearPlayers > 1) then {


		_dragger = selectRandom (_nearestunits - (playableUnits + switchableUnits + [_unit]));

            if ((alive _dragger) && ( _unitGrpPR == str side _dragger) && (side _dragger != civilian) && (!isPlayer _dragger) && (_dragger != _unit) && !(_dragger getVariable ["dam_ignore_dragger0",false]) && !(_dragger getVariable ["dam_ignore_injured0",false]) && !(_unit getVariable ["dam_player_lecit0",false])) exitWith {
			 _dragger setVariable ["dam_ignore_dragger0",true];
		     _tashit = 1;
            };
        };

	 sleep 1;
    };

	if (!alive _unit) exitWith {
	};
 
 	if (time >= _bloodtime) exitWith {
     _unit setDamage 1;

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

	 };

 	if (_unit getVariable ["dam_conec_istorii0",false]) exitWith {
	
	 _unit enableAI "ANIM";
	 _unit setUnitPos "AUTO";
	 sleep 0.1;
	 _unit enableAI "FSM";
	 _unit setCombatMode "RED";	
	 _unit setBehaviour "COMBAT";	
	 [_unit] joinSilent _unitGrp;
	 { _unit reveal _x; } forEach allUnits;	
	 _unit addEventHandler ["hitpart", {(_this select 0) spawn PiR}];
	};
 
 
 
 //______________________________________________________________________________________



//__________________Потаскун подбирается к раненному____________________________________

    if ((alive _dragger) && (alive _unit) && !(_dragger getVariable ["dam_ignore_injured0",false]) && !(_unit getVariable ["dam_conec_istorii0",false]) && !(_unit getVariable ["dam_player_lecit0",false]) ) then {



     _dragger setUnitPos "MIDDLE";			
     _dragger doMove getpos _unit;


     _future = (time +  30 + random 15);

        waituntil { sleep 0.1; (_dragger distance _unit < 5) or (!alive _unit) or (!alive _dragger) or (time >= _future) or (_dragger getVariable ["dam_ignore_injured0",false]) or (_unit getVariable ["dam_conec_istorii0",false]) or (_unit getVariable ["dam_player_lecit0",false]) };

	 sleep 1;
		
        if ((!alive _dragger) or (_dragger getVariable ["dam_ignore_injured0",false])) exitWith {
		 _dragger setVariable ["dam_ignore_dragger0",false];
		}; 

        if ((!alive _unit) or (time >= _future) or (_unit getVariable ["dam_conec_istorii0",false]) or (_unit getVariable ["dam_player_lecit0",false])) exitWith {
         _dragger setUnitPos "AUTO";
         dostop _dragger;
		 _dragger setVariable ["dam_ignore_dragger0",false];
		 }; 



//__________________Пускаем дым_________________________________________________________	 
	 
     _randomSmoke = selectRandom [1,2,3];

        if (_randomSmoke == 2) then {
         createVehicle ["SmokeShell", _unit, [], (random 6), "CAN_COLLIDE"];
        };
		
//______________________________________________________________________________________
 

//__________________Потаскун цепляет раненного__________________________________________
     _unit setVariable ["dam_uncondition_injured0",true];
		 _DummyClone = {
		 private ["_dummy", "_dummygrp", "_dragger","_dummyV"];
		 _dragger = _this;
	
		 _dummygrp = createGroup civilian;
		 _dummy = _dummygrp createUnit ["C_Soldier_VR_F", [0,0,0], [], 0, "FORM"];
		 _dummy hideObjectGlobal true;
		 _dummy setDamage 0.6;
		 _dummy allowdammage false;
		 _dummy setBehaviour "CARELESS";
		 _dummy disableAI "FSM";	
		 _dummy setUnitPos "UP";
		 dostop _dragger;
		 sleep 0.3;
		 _dummyV = vectorDir (_dragger);		 
		 _dummy setPos ([_dragger, 0.6, (getDir _dragger)] call BIS_fnc_relPos);
		 _dummy	setDir ((getDir _dragger) - 180);	

		_dummy doMove ([_dragger, 10, ((getDir _dragger) - 180)] call BIS_fnc_relPos);
		 
		 sleep 0.1;		 
		 _dragger attachTo [_dummy, [0, 0.6, 0]]; 
	     _dragger setDir 180;
		 _dragger setVectorDir _dummyV;		 
		 _dummypos = position _dummy;
		 _dummy
	
		};

	 _dummy = _dragger call _DummyClone;


	 [ _unit ] remoteExec [ "dam_fnc_wake", 2 ];
	 _dragger playAction "grabDrag";

	 sleep 0.1;
	 _unit setDir (_unit getdir _dragger);
	 [[_unit,"AinjPpneMrunSnonWnonDb"] remoteExec ["switchMove"]]; 	


	 
		waitUntil { sleep 0.1; (AnimationState _dragger == "amovpercmstpslowwrfldnon_acinpknlmwlkslowwrfldb_2") or (AnimationState _dragger == "amovpercmstpsnonwnondnon_acinpknlmwlksnonwnondb_2") or (!alive _dragger) or (_dragger getVariable ["dam_ignore_injured0",false]) or (!alive _unit)
		}; 

		
		
		if ((!alive _dragger) or (_dragger getVariable ["dam_ignore_injured0",false])) exitwith {	
		 _dragger enableAI "ANIM";	
		 detach _dragger;
		 detach _dummy;
		 deleteVehicle _dummy;
		 [[_unit,""] remoteExec ["switchMove"]]; 
		 [_unit] remoteExec [ "dam_fnc_setunconscious", 2 ];
		 _unit playMove _anim;
 		 _dragger setVariable ["dam_ignore_dragger0",false];
		 _statys = 1;
		};

		if (!alive _unit) exitwith {
		 detach _dragger;
		 detach _dummy;
		 deleteVehicle _dummy;
		 [[_dragger,""] remoteExec ["switchMove"]]; 
		 _dragger enableAI "ANIM";
		 _dragger setCombatMode "RED";	
		 _dragger setBehaviour "AWARE";	
 		 _dragger setVariable ["dam_ignore_dragger0",false];
		 { _dragger reveal _x; } forEach allUnits;

		};
		 _unit attachTo [_dummy, [-0.1, -0.5, 0]];
		 [_unit] joinSilent grpNull;


		 _dragger playMove "AcinPknlMwlkSrasWrflDb"; _dragger disableAI "ANIM";	

//______________________________________________________________________________________


//__________________Выбираем точку эвакуации____________________________________________


	 _emptyHouse = [];
	 _nearesthouses = _dragger nearObjects ["House",100];
	 _houseList = [];
		{
			for "_i" from 0 to 3 do {
				if ( [(_x buildingPos _i), [0,0,0]] call BIS_fnc_arrayCompare ) exitWith {
					if (_i > 0) then {
					 _houseList set [count _houseList, [_x, _i]];
					};
				};
			};    
		}forEach _nearesthouses;

		if !(_houseList isEqualTo _emptyHouse) then {

		 _randomHouse = _houseList select (floor (random (count _houseList)));
		 _Pos = (_randomHouse select 0) buildingPos (floor (random (_randomHouse select 1)));

        } else { 
	
		 _dis = (30 + random 20);	
		 _Pos = [_dragger, _dis, random 360] call BIS_fnc_relPos;
	
		};

		if (_pos distance _pos0 < 10) then {
		 _dis = (30 + random 20);	
		 _Pos = [_unit, _dis, random 360] call BIS_fnc_relPos;
		};

			_pos0 = _pos;
	 


//______________________________________________________________________________________


//__________________Потаскун тащит раненного____________________________________________

		 _dummy doMove _Pos;

 
	 
	 _future = time + 3;

		waitUntil { sleep 0.1; (_dummy distance _Pos < 5) or (!alive _dragger) or (!alive _unit) or (_dragger getVariable ["dam_ignore_injured0",false]) or (time >= _future)
		};
		
		if (_dummy distance _dummypos < 0.5) then {
		 _pos = position _dummy;
		};

	 _future = (time + 40 + random 15);



		waituntil { sleep 0.1; (_dummy distance _Pos < 5) or (!alive _dragger) or (!alive _unit) or (_dragger getVariable ["dam_ignore_injured0",false]) or (time >= _future) or (_unit distance _dragger > 1.5) or (AnimationState _dragger != "acinpknlmwlksraswrfldb") or ((AnimationState _unit != "ainjppnemrunsnonwnondb") && (AnimationState _unit != "ainjppnemrunsnonwnondb_still"))
		};
//______________________________________________________________________________________
		
		
		
//__________________ Потаскун начинает лечение__________________________________________
	
		
			if ((!alive _dragger) or (_dragger getVariable ["dam_ignore_injured0",false])) then {	
			_dragger enableAI "ANIM";
			detach _unit;	
			detach _dragger;
			detach _dummy;
			deleteVehicle _dummy;
			[[_unit,""] remoteExec ["switchMove"]]; 
			[_unit] remoteExec [ "dam_fnc_setunconscious", 2 ];
			_unit playMove _anim;
			[_unit] joinSilent _unitGrp;
			_dragger setVariable ["dam_ignore_dragger0",false];

				if (true) exitwith {

				_statys = 1;

				};


			} else {

				if (!alive _unit) then {
				detach _unit;
				detach _dragger;
				detach _dummy;
				deleteVehicle _dummy;
			 [[_dragger,""] remoteExec ["switchMove"]]; 
				_dragger enableAI "ANIM";
				_dragger setCombatMode "RED";	
				_dragger setBehaviour "AWARE";	
				{ _dragger reveal _x; } forEach allUnits;
				 dostop _dragger;
				_dragger setVariable ["dam_ignore_dragger0",false];	

					if (true) exitwith {
					};

				} else {

					if ((_dummy distance _Pos < 5) or (time >= _future) or (AnimationState _dragger != "acinpknlmwlksraswrfldb") or ((AnimationState _unit != "ainjppnemrunsnonwnondb") && (AnimationState _unit != "ainjppnemrunsnonwnondb_still"))) then {
		
					 detach _unit;
					 detach _dragger;
					 detach _dummy;
					 deleteVehicle _dummy;
					 [[_dragger,"AcinPknlMstpSrasWrflDnon_AmovPknlMstpSrasWrflDnon"] remoteExec ["playMove"]]; 
					 [[_unit,"AinjPpneMrunSnonWnonDb_release"] remoteExec ["playMove"]];
					 sleep 1;
  					 _unit setDir ((getdir _dragger) + 90);
					 [_unit] remoteExec [ "dam_fnc_setunconscious", 2 ];

					 sleep 4;
					 _dis = 1;       
					if ((alive _dragger) && (alive _unit) && !(_dragger getVariable ["dam_ignore_injured0",false])) then {
					 _dummyV = vectorDir (_unit);
					 _unit attachTo [_dragger, [-0.2, 0.7, 0]];
					 _unit setVectorDir _dummyV;
					 _unit setDir 90;
					 _dis = 0;
					 _future = time + 20 + (random 15);
					 _dragger playmove "AinvPknlMstpSnonWrflDr_medic4_old";

					 while {true}                  
						do {
							if ((!alive _dragger) or (!alive _unit) or (_dragger getVariable ["dam_ignore_injured0",false]) or (time >= _future)) exitWith {
		
							};

							if (AnimationState _dragger == "AinvPknlMstpSnonWrflDnon_medicEnd" or  AnimationState _dragger == "AinvPknlMstpSnonWrflDr_medic0S" ) then {
						 	 _dragger playmove (selectRandom ["AinvPknlMstpSnonWrflDr_medic0_old", "AinvPknlMstpSnonWrflDr_medic1_old", "AinvPknlMstpSnonWrflDr_medic2_old", "AinvPknlMstpSnonWrflDr_medic3_old", "AinvPknlMstpSnonWrflDr_medic4_old", "AinvPknlMstpSnonWrflDr_medic5_old"]);	
							};
	
						 sleep 1;
						};

					 detach _dragger;
					 detach _unit;
					 };

						if ((!alive _dragger) or (_dragger getVariable ["dam_ignore_injured0",false])) then {


						 [_unit] joinSilent _unitGrp;
 						 [[_unit,_anim] remoteExec ["switchMove"]];

						 _unit playMove _anim;
  						 _dragger enableAI "ANIM";
	
						 _dragger setVariable ["dam_ignore_dragger0",false];						
							if ( _dis == 0 ) then {
								[[_dragger,""] remoteExec ["switchMove"]];
							};
							if (true) exitwith {
						
							 _statys = 1;

							};


						} else {

						 [[_dragger,"AinvPknlMstpSnonWrflDnon_medicEnd"] remoteExec ["switchMove"]]; 
						 sleep 3;
						 _unit setDamage 0;
						 [ _unit ] remoteExec [ "dam_fnc_wake", 2 ];
						 [[_unit,"UnconsciousOutProne"] remoteExec ["switchMove"]]; 

						 _dragger enableAI "ANIM";
						 _dragger setCombatMode "RED";	
						 _dragger setBehaviour "AWARE";
						 _dragger setUnitPos "AUTO";	

						 sleep 0.1;
	
						 { _dragger reveal _x; } forEach allUnits;
						 dostop _dragger;
						 _dragger setVariable ["dam_ignore_dragger0",false];	
							if (true) exitwith {
							 _unit setVariable ["dam_conec_istorii0",true];

							};

						};

					};


				};

			};


		










	};


//______________________________________________________________________________________
 

};

//______________________________________________________________________________________
 {_unit addMagazine _x} forEach _magsremove;

			if (_numberOfKits > 0 ) then {
				for "_i" from 1 to _numberOfKits do { _unit addItem "FirstAidKit"};
			};
 _unit setVariable ["dam_ignore_injured0",false];
 _unit setVariable ["dam_conec_istorii0",false];


[_unit] remoteExec [ "removeAllActions", 0, true ];








