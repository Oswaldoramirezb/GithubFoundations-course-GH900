// Función para sumar dos números
function sumar(a, b) {
    return a + b;
}

// Función para restar dos números
function restar(a, b) {
    return a - b;
}

// Función para multiplicar dos números
function multiplicar(a, b) {
    return a * b;
}

// Función para dividir dos números
function dividir(a, b) {
    if (b === 0) {
        throw new Error("No se puede dividir entre cero");
    }
    return a / b;
}

// Función para obtener el máximo de un array
function obtenerMaximo(numeros) {
    if (numeros.length === 0) {
        throw new Error("El array no puede estar vacío");
    }
    return Math.max(...numeros);
}

// Función para obtener el mínimo de un array
function obtenerMinimo(numeros) {
    if (numeros.length === 0) {
        throw new Error("El array no puede estar vacío");
    }
    return Math.min(...numeros);
}

module.exports = {
    sumar,
    restar,
    multiplicar,
    dividir,
    obtenerMaximo,
    obtenerMinimo
};
