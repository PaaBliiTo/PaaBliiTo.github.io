pragma solidity ^0.4.0;


//Managing a company's stock thanks to Solidity Smart Contract

// IDEES : l'entreprise a plusieurs variables : nombre d'actions totale, nombre d'actions libres
//Variables pour les acteurs : nb actions détenues
//Nouvelle struct intermédiaire : Variables en attente de vente/achat
//Fonctions : achat (acheter d'abord les actions de l'entreprise s'il en reste, sinon prendre dans la struct intermédiaire)
//vente (mettre les variables en attente de vente dans la struct jusqu'à qu'il y en ait de disponibles)



contract TP2 {

	struct Company {
	}

	struct Actor {
	}

	
}