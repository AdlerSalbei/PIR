

if (!isServer) exitWith {};
	 
	 
["PiR_injuriplayer_on", "CHECKBOX", ["Влючить ранения для игрока", "Enable injuries for player"], "Project injury Reaction", true] call cba_settings_fnc_init;




dam_fnc_setunconscious = {
	params[ "_unit" ];
[ _unit, true ] remoteExec [ "setUnconscious", _unit ];
	
};

dam_fnc_wake = {
	params[ "_unit" ];
[ _unit, false ] remoteExec [ "setUnconscious", _unit ];
	
};















// Назначение действий на попадание игрок
fnc_PiR0 = { 

     private ["_unit","_selection","_shans"];
	_unit = (_this select 0);
	_selection = (_this select 5);



	if (vehicle _unit != _unit) exitWith {
	
		if !(_unit getVariable ["dam_ignore_effect0",false]) then {

		 _unit setVariable ["dam_ignore_effect0",true];	
		 _null = [_unit, _anim, _shans] spawn dam_effectnaglaza0;
		};
	
	};

	
	
	
if !(_unit getVariable ["dam_ignore_injured0",false]) then {



//________________________________Распределение анимаций по частям тела______________________________________________________________________		

	_anim = selectRandom [
	"UnconsciousReviveArms_A","UnconsciousReviveArms_B","UnconsciousReviveArms_C","UnconsciousReviveBody_A",
	"UnconsciousReviveBody_B","UnconsciousReviveDefault_A","UnconsciousReviveDefault_B","UnconsciousReviveDefault_C","UnconsciousReviveHead_A",
	"UnconsciousReviveHead_B","UnconsciousReviveHead_C","UnconsciousReviveLegs_A","UnconsciousReviveLegs_B"];
		
_shans = 8;
					
						

		if ("head" in _selection) then {
		_anim = selectRandom [
		"UnconsciousReviveHead_A","UnconsciousReviveHead_B","UnconsciousReviveHead_C"];
_shans = 10;
		};


		if ("spine1" in _selection) then {
		_anim = selectRandom [
		"UnconsciousReviveBody_A","UnconsciousReviveBody_B","UnconsciousReviveDefault_A"];
_shans = 7;
		};

		if ("spine3" in _selection) then {
		_anim = selectRandom [
		"UnconsciousReviveDefault_A","UnconsciousReviveDefault_B","UnconsciousReviveDefault_C"];
_shans = 9;
		};	

		if (("leftforearm" in _selection) or ("rightforearm" in _selection)) then {
		_anim = selectRandom [
		"UnconsciousReviveArms_A","UnconsciousReviveArms_B","UnconsciousReviveArms_C"];
_shans = 1;
		};

		if (("leftarm" in _selection) or ("rightarm" in _selection)) then {
		_anim = selectRandom [
		"UnconsciousReviveArms_A","UnconsciousReviveArms_B","UnconsciousReviveArms_C"];
_shans = 3;
		};

		if (("leftupleg" in _selection) or ("rightupleg" in _selection)) then {
		_anim = selectRandom [
		"UnconsciousReviveLegs_A","UnconsciousReviveLegs_B"];
_shans = 6;
		};

		if (("leftleg" in _selection) or ("rightleg" in _selection)) then {
		_anim = selectRandom [
		"UnconsciousReviveLegs_A","UnconsciousReviveLegs_B"];
_shans = 4;
		};

		if (("leftfoot" in _selection) or ("rightfoot" in _selection)) then {
		_anim = selectRandom [
		"UnconsciousReviveLegs_A","UnconsciousReviveLegs_B"];
_shans = 2;
		};


//_____________________________________________________________________________________________________________________




// Голова	
if ((_shans == 10) && !(_unit getVariable ["dam_ignore_injured0",false])) then {

		_unit setVariable ["dam_ignore_injured0",true];	
		_unit 	removeAllEventHandlers "hitpart";

		if ((_shans - (random 25)) >=0) then {
		_null = [_unit, _anim, _shans] spawn dam_shlem0;
		} else {

		_null = [_unit, _anim, _shans] spawn dam_inCap0;	
		};
		};


//	Живот и Грудь		
if (((_shans == 7) or (_shans == 9)) && ((_shans - (random 10)) >=0) && !(_unit getVariable ["dam_ignore_injured0",false])) then {

		_unit setVariable ["dam_ignore_injured0",true];	
		_unit 	removeAllEventHandlers "hitpart";

		if ((_shans - (random 22)) >=0) then {
		_null = [_unit, _anim, _shans] spawn dam_contuzia0;
		} else {
			if ((_shans - (random 14)) >=0) then {
		     _null = [_unit, _anim, _shans] spawn dam_otpolzanie0;	
			} else {
			_null = [_unit, _anim, _shans] spawn dam_inCap0;
			 };
		};	
		};

// Верх руки и Низ руки
if (((_shans == 1) or (_shans == 3)) && ((7 - (random 10)) >=0) && !(_unit getVariable ["dam_ignore_injured0",false])) then {

		_unit setVariable ["dam_ignore_injured0",true];	
		_unit 	removeAllEventHandlers "hitpart";

		if (((_shans - (random 8)) <=0) && !(_unit getVariable ["dam_ignore_dragger0",false])) then {
		_null = [_unit, _anim, _shans] spawn dam_bezoruzia0;
		} else {
			if ((_shans - (random 10)) >=0) then {
		     _null = [_unit, _anim, _shans] spawn dam_inCap0;	
			} else {
			_null = [_unit, _anim, _shans] spawn dam_otpolzanie0;
			 };
		};	
		};	

// Бедро, голень и стопа
if (((_shans == 6) or (_shans == 4) or (_shans == 2)) && ((_shans - (random 10)) >=0) && !(_unit getVariable ["dam_ignore_injured0",false])) then {

		_unit setVariable ["dam_ignore_injured0",true];	
		_unit 	removeAllEventHandlers "hitpart";

		if ((_shans - (random 22)) >=0) then {
		_null = [_unit, _anim, _shans] spawn dam_inCap0;
		} else {
		     _null = [_unit, _anim, _shans] spawn dam_otpolzanie0;	

		};	
		};	

// Подрыв
if ((_shans == 8) && ((_shans - (random 10)) >=0) && !(_unit getVariable ["dam_ignore_injured0",false])) then {

		_unit setVariable ["dam_ignore_injured0",true];	
		_unit 	removeAllEventHandlers "hitpart";

		if ((_shans - (random 16)) >=0) then {
		_null = [_unit, _anim, _shans] spawn dam_otpolzanie0;
		} else {
			if ((_shans - (random 12)) >=0) then {
		     _null = [_unit, _anim, _shans] spawn dam_inCap0;	
			} else {
			if ((_shans - (random 12)) >=0) then {
		     _null = [_unit, _anim, _shans] spawn dam_contuzia0;	
			} else {
			_null = [_unit, _anim, _shans] spawn dam_shlem0;
			 };
		};	
		};		
		};
	
	//_____________________________________________________________________________________________________________________	

//________________________________Крик при попадании_______________________________________________________________________
  if (_shans !=10 ) then {
   [_unit, (selectRandom ["Hit1", "Hit2", "Hit3", "Hit4", "Hit5", "Hit6", "Hit7", "Hit8", "Hit9", "Hit10"]) ] remoteExec [ "say3D", 0];
  };
//__________________________________________________________________________________________________________________________


//________________________________Эффекты крови_____________________________________________________________________________

	if !(_unit getVariable ["dam_ignore_effect0",false]) then {

	 _unit setVariable ["dam_ignore_effect0",true];	
	 _null = [_unit, _anim, _shans] spawn dam_effectnaglaza0;
	};

//__________________________________________________________________________________________________________________________	
//________________________________Стоны при ранении_________________________________________________________________________
		while {true} do {

	 		 sleep (40 + random 20);		
				 
		 if (!(_unit getVariable ["dam_ignore_injured0",false]) or !(alive _unit)) exitWith {};	


	
		 [_unit, (selectRandom ["pain1", "pain2", "pain3", "pain4", "pain5", "pain6", "pain7", "pain8", "pain9"]) ] remoteExec [ "say3D", 0];


		 
		};
		
//___________________________________________________________________________________________________________________________

	

	sleep 1;	
	if !(alive _unit) then {

		_unit 	removeAllMPEventHandlers "MPHit";	
	
	};
	};
};
























// Назначение действий на попадание ИИ
fnc_PiR = { 

hint (str _this);

	private ["_unit","_selection","_shans"];

	_unit = (_this select 0);
	_selection = (_this select 5);
	
	if (vehicle _unit != _unit) exitWith {
	
		if !(_unit getVariable ["dam_ignore_effect0",false]) then {

		 _unit setVariable ["dam_ignore_effect0",true];	
		 _null = [_unit, _anim, _shans] spawn dam_effectnaglaza;
		};
	
	};

if !(_unit getVariable ["dam_ignore_injured0",false]) then {


//________________________________Распределение анимаций по частям тела______________________________________________________________________		

	_anim = selectRandom [
	"UnconsciousReviveArms_A","UnconsciousReviveArms_B","UnconsciousReviveArms_C","UnconsciousReviveBody_A",
	"UnconsciousReviveBody_B","UnconsciousReviveDefault_A","UnconsciousReviveDefault_B","UnconsciousReviveDefault_C","UnconsciousReviveHead_A",
	"UnconsciousReviveHead_B","UnconsciousReviveHead_C","UnconsciousReviveLegs_A","UnconsciousReviveLegs_B"];
		
_shans = 8;
					
						

		if ("head" in _selection) then {
		_anim = selectRandom [
		"UnconsciousReviveHead_A","UnconsciousReviveHead_B","UnconsciousReviveHead_C"];
_shans = 10;
		};


		if ("spine1" in _selection) then {
		_anim = selectRandom [
		"UnconsciousReviveBody_A","UnconsciousReviveBody_B","UnconsciousReviveDefault_A"];
_shans = 7;
		};

		if ("spine3" in _selection) then {
		_anim = selectRandom [
		"UnconsciousReviveDefault_A","UnconsciousReviveDefault_B","UnconsciousReviveDefault_C"];
_shans = 9;
		};	

		if (("leftforearm" in _selection) or ("rightforearm" in _selection)) then {
		_anim = selectRandom [
		"UnconsciousReviveArms_A","UnconsciousReviveArms_B","UnconsciousReviveArms_C"];
_shans = 1;
		};

		if (("leftarm" in _selection) or ("rightarm" in _selection)) then {
		_anim = selectRandom [
		"UnconsciousReviveArms_A","UnconsciousReviveArms_B","UnconsciousReviveArms_C"];
_shans = 3;
		};

		if (("leftupleg" in _selection) or ("rightupleg" in _selection)) then {
		_anim = selectRandom [
		"UnconsciousReviveLegs_A","UnconsciousReviveLegs_B"];
_shans = 6;
		};

		if (("leftleg" in _selection) or ("rightleg" in _selection)) then {
		_anim = selectRandom [
		"UnconsciousReviveLegs_A","UnconsciousReviveLegs_B"];
_shans = 4;
		};

		if (("leftfoot" in _selection) or ("rightfoot" in _selection)) then {
		_anim = selectRandom [
		"UnconsciousReviveLegs_A","UnconsciousReviveLegs_B"];
_shans = 2;
		};



//_____________________________________________________________________________________________________________________

// Голова	
if ((_shans == 10) && !(_unit getVariable ["dam_ignore_injured0",false])) then {

		_unit setVariable ["dam_ignore_injured0",true];	
		_unit 	removeAllEventHandlers "hitpart";

		if ((_shans - (random 25)) >=0) then {
		_null = [_unit, _anim, _shans] spawn dam_shlem;
		} else {

		_null = [_unit, _anim, _shans] spawn dam_inCap;	
		};
		};


//	Живот и Грудь		
if (((_shans == 7) or (_shans == 9)) && ((_shans - (random 10)) >=0) && !(_unit getVariable ["dam_ignore_injured0",false])) then {

		_unit setVariable ["dam_ignore_injured0",true];	
		_unit 	removeAllEventHandlers "hitpart";

		if ((_shans - (random 22)) >=0) then {
		_null = [_unit, _anim, _shans] spawn dam_contuzia;
		} else {
			if ((_shans - (random 14)) >=0) then {
		     _null = [_unit, _anim, _shans] spawn dam_otpolzanie;	
			} else {
			_null = [_unit, _anim, _shans] spawn dam_inCap;
			 };
		};	
		};

// Верх руки и Низ руки
if (((_shans == 1) or (_shans == 3)) && ((7 - (random 10)) >=0) && !(_unit getVariable ["dam_ignore_injured0",false])) then {

		_unit setVariable ["dam_ignore_injured0",true];	
		_unit 	removeAllEventHandlers "hitpart";

		if (((_shans - (random 8)) <=0) && !(_unit getVariable ["dam_ignore_dragger0",false])) then {
		_null = [_unit, _anim, _shans] spawn dam_bezoruzia;
		} else {
			if ((_shans - (random 10)) >=0) then {
		     _null = [_unit, _anim, _shans] spawn dam_inCap;	
			} else {
			_null = [_unit, _anim, _shans] spawn dam_otpolzanie;
			 };
		};	
		};	

// Бедро, голень и стопа
if (((_shans == 6) or (_shans == 4) or (_shans == 2)) && ((_shans - (random 10)) >=0) && !(_unit getVariable ["dam_ignore_injured0",false])) then {

		_unit setVariable ["dam_ignore_injured0",true];	
		_unit 	removeAllEventHandlers "hitpart";

		if ((_shans - (random 22)) >=0) then {
		_null = [_unit, _anim, _shans] spawn dam_inCap;
		} else {
		     _null = [_unit, _anim, _shans] spawn dam_otpolzanie;	

		};	
		};	

// Подрыв
if ((_shans == 8) && ((_shans - (random 10)) >=0) && !(_unit getVariable ["dam_ignore_injured0",false])) then {

		_unit setVariable ["dam_ignore_injured0",true];	
		_unit 	removeAllEventHandlers "hitpart";

		if ((_shans - (random 16)) >=0) then {
		_null = [_unit, _anim, _shans] spawn dam_otpolzanie;
		} else {
			if ((_shans - (random 12)) >=0) then {
		     _null = [_unit, _anim, _shans] spawn dam_inCap;	
			} else {
			if ((_shans - (random 12)) >=0) then {
		     _null = [_unit, _anim, _shans] spawn dam_contuzia;	
			} else {
			_null = [_unit, _anim, _shans] spawn dam_shlem;
			 };
		};	
		};		
		};
	
	
	
	//_____________________________________________________________________________________________________________________	

	//________________________________Крик при попадании_______________________________________________________________________

  if (_shans !=10 ) then {
   [_unit, (selectRandom ["Hit1", "Hit2", "Hit3", "Hit4", "Hit5", "Hit6", "Hit7", "Hit8", "Hit9", "Hit10"]) ] remoteExec [ "say3D", 0];
  };


	 
	 
//__________________________________________________________________________________________________________________________	



//________________________________Эффекты крови_____________________________________________________________________________

	if !(_unit getVariable ["dam_ignore_effect0",false]) then {

	 _unit setVariable ["dam_ignore_effect0",true];	
	 _null = [_unit, _anim, _shans] spawn dam_effectnaglaza;
	};

//__________________________________________________________________________________________________________________________



//________________________________Стоны при ранении_________________________________________________________________________
		while {true} do {

	 		 sleep (40 + random 20);
			 
		 if (!(_unit getVariable ["dam_ignore_injured0",false]) or !(alive _unit)) exitWith {};	


	
		 [_unit, (selectRandom ["pain1", "pain2", "pain3", "pain4", "pain5", "pain6", "pain7", "pain8", "pain9"]) ] remoteExec [ "say3D", 0];


		 
		};
		

//__________________________________________________________________________________________________________________________
	

	sleep 1;	
	if !(alive _unit) then {

	_unit 	removeAllEventHandlers "hitpart";	
	
	};
	};
};



//Добавляем  юнитам отслеживание попадания
_units = [];
while { (true) } do {

	{



		
		if ((_x isKindOf "Man")) then
        {

            if (("INCAPACITATED" != lifeState _x) && (alive _x) && !(_x getVariable ["dam_ignore_hit0",false]) && (AnimationState _x != "ainjppnemrunsnonwnondb") && (AnimationState _x != "ainjppnemrunsnonwnondb_still") && (AnimationState _x != "UnconsciousFaceDown") && (AnimationState _x != "UnconsciousFaceUp") && (AnimationState _x != "UnconsciousReviveDefault_C") && (AnimationState _x != "UnconsciousOutProne")) then 
			{
			 _units pushBack _x; 

			 _x removeAllMPEventHandlers "MPHit";
 			 _x setVariable ["dam_ignore_hit0",true];
				if (!isplayer _x) then {
				 [_x, ["HitPart", {(_this select 0) spawn fnc_PiR}]] remoteExec ["addEventHandler",0 , true];
				} else {
					if !(PiR_injuriplayer_on) exitwith {};
				 [_x, ["HitPart", {(_this select 0) spawn fnc_PiR0}]] remoteExec ["addEventHandler",0 , true];
				};
			 };
	
		};
	
	} forEach allUnits;

sleep 60;

};








