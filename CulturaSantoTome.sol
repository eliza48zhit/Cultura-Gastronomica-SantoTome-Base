// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/**
 * @title CulturaSantoTome
 * @dev Registro de procesos de emulsion lipidica y fermentacion de semillas.
 * Serie: Sabores de Africa (41/54)
 */
contract CulturaSantoTome {

    struct Plato {
        string nombre;
        string ingredientes;
        string preparacion;
        uint256 calidadEmulsion;     // Estabilidad de la salsa de palma y okra (1-100)
        uint256 gradoFermentacion;   // Control de procesos en cacao o pescado (1-10)
        bool usaHierbasVolcanicas;   // Presencia de flora endemica (ossame/matabala)
        uint256 likes;
        uint256 dislikes;
    }

    mapping(uint256 => Plato) public registroCulinario;
    uint256 public totalRegistros;
    address public owner;

    constructor() {
        owner = msg.sender;
        // Inauguramos con el Calulu de Peixe (Ingenieria de la Emulsion)
        registrarPlato(
            "Calulu de Peixe", 
            "Pescado seco y fresco, aceite de palma, okra, hojas de boniato, ossame.",
            "Coccion lenta estratificada donde el aceite de palma se emulsiona con el mucilago de la okra.",
            92, 
            3, 
            true
        );
    }

    function registrarPlato(
        string memory _nombre, 
        string memory _ingredientes,
        string memory _preparacion,
        uint256 _emulsion, 
        uint256 _fermentacion,
        bool _hierbas
    ) public {
        require(bytes(_nombre).length > 0, "Nombre requerido");
        require(_emulsion <= 100, "Escala de emulsion excedida");

        totalRegistros++;
        registroCulinario[totalRegistros] = Plato({
            nombre: _nombre,
            ingredientes: _ingredientes,
            preparacion: _preparacion,
            calidadEmulsion: _emulsion,
            gradoFermentacion: _fermentacion,
            usaHierbasVolcanicas: _hierbas,
            likes: 0,
            dislikes: 0
        });
    }

    function darLike(uint256 _id) public {
        require(_id > 0 && _id <= totalRegistros, "ID invalido");
        registroCulinario[_id].likes++;
    }

    function darDislike(uint256 _id) public {
        require(_id > 0 && _id <= totalRegistros, "ID invalido");
        registroCulinario[_id].dislikes++;
    }
}
