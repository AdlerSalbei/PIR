
if (!isServer) exitWith {};

// Назначение действий на попадание ИИ




	private ["_unit","_selection","_shans"];
hint (str _this);
	_unit = (_this select 0) ;
	


IF !(_unit getVariable ["dam_ignore_injured0",false]) then {


//________________________________Распределение анимаций по частям тела______________________________________________________________________		

	_anim = selectRandom [
	"UnconsciousReviveArms_A","UnconsciousReviveArms_B","UnconsciousReviveArms_C","UnconsciousReviveBody_A",
	"UnconsciousReviveBody_B","UnconsciousReviveDefault_A","UnconsciousReviveDefault_B","UnconsciousReviveDefault_C","UnconsciousReviveHead_A",
	"UnconsciousReviveHead_B","UnconsciousReviveHead_C","UnconsciousReviveLegs_A","UnconsciousReviveLegs_B"];
		
_shans = 0;

	if (vehicle _unit != _unit) exitWith {
	
		IF !(_unit getVariable ["dam_ignore_effect0",false]) then {

		 _unit setVariable ["dam_ignore_effect0",true];	
		 _null = [_unit, _anim, _shans] spawn EyeEffect;
		};
	
	};

IF (damage _unit > 0) then {




		if ((_unit getHitPointDamage "HitFace" > 0.251) && (_unit getHitPointDamage "HitHead" > 0.251) && (_unit getHitPointDamage "HitNeck" > 0.251) && (_unit getHitPointDamage "HitPelvis" > 0.251) && (_unit getHitPointDamage "HitAbdomen" > 0.251) && (_unit getHitPointDamage "HitDiaphragm" > 0.251) && (_unit getHitPointDamage "HitChest" > 0.251) && (_unit getHitPointDamage "HitBody" > 0.251) && (_unit getHitPointDamage "HitHands" > 0.251) && (_unit getHitPointDamage "HitArms" > 0.251) && (_unit getHitPointDamage "HitLegs" > 0.251)) exitWith {

			_anim = selectRandom [
	"UnconsciousReviveArms_A","UnconsciousReviveArms_B","UnconsciousReviveArms_C","UnconsciousReviveBody_A",
	"UnconsciousReviveBody_B","UnconsciousReviveDefault_A","UnconsciousReviveDefault_B","UnconsciousReviveDefault_C","UnconsciousReviveHead_A",
	"UnconsciousReviveHead_B","UnconsciousReviveHead_C","UnconsciousReviveLegs_A","UnconsciousReviveLegs_B"];
		
_shans = 8;
		
		};
					
						




		if ((_unit getHitPointDamage "HitPelvis" > 0.251) or (_unit getHitPointDamage "HitAbdomen" > 0.251)) exitWith {
		_anim = selectRandom [
		"UnconsciousReviveBody_A","UnconsciousReviveBody_B","UnconsciousReviveDefault_A"];
_shans = 7;
		};

		if ((_unit getHitPointDamage "HitDiaphragm" > 0.251) or (_unit getHitPointDamage "HitChest" > 0.251) or (_unit getHitPointDamage "HitBody" > 0.25) or (_unit getHitPointDamage "HitNeck" > 0.251)) exitWith {
		_anim = selectRandom [
		"UnconsciousReviveDefault_A","UnconsciousReviveDefault_B","UnconsciousReviveDefault_C"];
_shans = 9;
		};	

		if (_unit getHitPointDamage "HitHands" > 0.251) exitWith {
		_anim = selectRandom [
		"UnconsciousReviveArms_A","UnconsciousReviveArms_B","UnconsciousReviveArms_C"];
_shans = 1;
		};



		if (_unit getHitPointDamage "HitLegs" > 0.251) exitWith {
		_anim = selectRandom [
		"UnconsciousReviveLegs_A","UnconsciousReviveLegs_B"];
_shans = 5;
		};


		if (_unit getHitPointDamage "HitArms" > 0.251) exitWith {
		_anim = selectRandom [
		"UnconsciousReviveArms_A","UnconsciousReviveArms_B","UnconsciousReviveArms_C"];
_shans = 3;
		};

		
		
		if ((_unit getHitPointDamage "HitFace" > 0.251) or (_unit getHitPointDamage "HitHead" > 0.251)) exitWith {
		_anim = selectRandom [
		"UnconsciousReviveHead_A","UnconsciousReviveHead_B","UnconsciousReviveHead_C"];
_shans = 10;
		};		
		
		
		
};


//_____________________________________________________________________________________________________________________

// Голова	
IF ((_shans == 10) && !(_unit getVariable ["dam_ignore_injured0",false])) then {
//hint "Голова";
		_unit setVariable ["dam_ignore_injured0",true];	
		_unit 	removeAllMPEventHandlers "MPHit";

		IF ((_shans - (random 25)) >=0) then {
		_null = [_unit, _anim, _shans] spawn Helmet;
		} ELSE {

		_null = [_unit, _anim, _shans] spawn Uncondition;	
		};
		};


//	Живот и Грудь		
IF (((_shans == 7) or (_shans == 9)) && ((_shans - (random 10)) >=0) && !(_unit getVariable ["dam_ignore_injured0",false])) then {
//hint "Живот и грудь";
		_unit setVariable ["dam_ignore_injured0",true];	
		_unit 	removeAllMPEventHandlers "MPHit";

		IF ((_shans - (random 22)) >=0) then {
		_null = [_unit, _anim, _shans] spawn BendsDown;
		} ELSE {
			IF ((_shans - (random 14)) >=0) then {
		     _null = [_unit, _anim, _shans] spawn Crawl;	
			} ELSE {
			_null = [_unit, _anim, _shans] spawn Uncondition;
			 };
		};	
		};

// Верх руки и Низ руки
IF (((_shans == 1) or (_shans == 3)) && ((7 - (random 10)) >=0) && !(_unit getVariable ["dam_ignore_injured0",false])) then {
//hint "Руки";
		_unit setVariable ["dam_ignore_injured0",true];	
		_unit 	removeAllMPEventHandlers "MPHit";

		IF (((_shans - (random 8)) <=0) && !(_unit getVariable ["dam_ignore_dragger0",false])) then {
		_null = [_unit, _anim, _shans] spawn DropWeapon;
		} ELSE {
			IF ((_shans - (random 10)) >=0) then {
		     _null = [_unit, _anim, _shans] spawn Uncondition;	
			} ELSE {
			_null = [_unit, _anim, _shans] spawn Crawl;
			 };
		};	
		};	

// Бедро, голень и стопа
IF ((_shans == 5) && ((_shans - (random 8)) >=0) && !(_unit getVariable ["dam_ignore_injured0",false])) then {
//hint "Ноги";
		_unit setVariable ["dam_ignore_injured0",true];	
		_unit 	removeAllMPEventHandlers "MPHit";

		IF ((_shans - (random 22)) >=0) then {
		_null = [_unit, _anim, _shans] spawn Uncondition;
		} ELSE {
		     _null = [_unit, _anim, _shans] spawn Crawl;	

		};	
		};	

// Подрыв
IF ((_shans == 8) && ((_shans - (random 10)) >=0) && !(_unit getVariable ["dam_ignore_injured0",false])) then {
//hint "Подрыв";
		_unit setVariable ["dam_ignore_injured0",true];	
		_unit 	removeAllMPEventHandlers "MPHit";

		IF ((_shans - (random 16)) >=0) then {
		_null = [_unit, _anim, _shans] spawn Crawl;
		} ELSE {
			IF ((_shans - (random 12)) >=0) then {
		     _null = [_unit, _anim, _shans] spawn Uncondition;	
			} ELSE {
			IF ((_shans - (random 12)) >=0) then {
		     _null = [_unit, _anim, _shans] spawn BendsDown;	
			} ELSE {
			_null = [_unit, _anim, _shans] spawn Helmet;
			 };
		};	
		};		
		};
	
	
	
	//_____________________________________________________________________________________________________________________	

	//________________________________Крик при попадании_______________________________________________________________________

  IF (_shans !=10 ) then {
   [_unit, (selectRandom ["Hit1", "Hit2", "Hit3", "Hit4", "Hit5", "Hit6", "Hit7", "Hit8", "Hit9", "Hit10"]) ] remoteExec [ "say3D", 0];
  };


	 
	 
//__________________________________________________________________________________________________________________________	



//________________________________Эффекты крови_____________________________________________________________________________

	IF !(_unit getVariable ["dam_ignore_effect0",false]) then {

	 _unit setVariable ["dam_ignore_effect0",true];	
	 _null = [_unit, _anim, _shans] spawn EyeEffect;
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







