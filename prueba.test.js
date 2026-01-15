const {
    sumar,
    restar,
    multiplicar,
    dividir,
    obtenerMaximo,
    obtenerMinimo
} = require('./prueba.js');

describe('Pruebas de Funciones Matemáticas', () => {

    describe('Función Sumar', () => {
        test('debe sumar dos números positivos correctamente', () => {
            expect(sumar(2, 3)).toBe(5);
        });

        test('debe sumar números negativos correctamente', () => {
            expect(sumar(-2, -3)).toBe(-5);
        });

        test('debe sumar un número positivo y uno negativo', () => {
            expect(sumar(10, -5)).toBe(5);
        });

        test('debe sumar cero correctamente', () => {
            expect(sumar(0, 0)).toBe(0);
        });

        test('debe sumar decimales correctamente', () => {
            expect(sumar(1.5, 2.5)).toBe(4);
        });
    });

    describe('Función Restar', () => {
        test('debe restar dos números positivos correctamente', () => {
            expect(restar(10, 3)).toBe(7);
        });

        test('debe restar números negativos correctamente', () => {
            expect(restar(-5, -3)).toBe(-2);
        });

        test('debe restar resultando en número negativo', () => {
            expect(restar(3, 10)).toBe(-7);
        });

        test('debe restar cero correctamente', () => {
            expect(restar(5, 0)).toBe(5);
        });

        test('debe restar decimales correctamente', () => {
            expect(restar(5.5, 2.3)).toBeCloseTo(3.2, 1);
        });
    });

    describe('Función Multiplicar', () => {
        test('debe multiplicar dos números positivos correctamente', () => {
            expect(multiplicar(4, 5)).toBe(20);
        });

        test('debe multiplicar números negativos correctamente', () => {
            expect(multiplicar(-3, -4)).toBe(12);
        });

        test('debe multiplicar un positivo por un negativo', () => {
            expect(multiplicar(5, -2)).toBe(-10);
        });

        test('debe multiplicar por cero', () => {
            expect(multiplicar(100, 0)).toBe(0);
        });

        test('debe multiplicar decimales correctamente', () => {
            expect(multiplicar(2.5, 4)).toBe(10);
        });
    });

    describe('Función Dividir', () => {
        test('debe dividir dos números correctamente', () => {
            expect(dividir(10, 2)).toBe(5);
        });

        test('debe dividir resultando en decimal', () => {
            expect(dividir(10, 3)).toBeCloseTo(3.333, 2);
        });

        test('debe dividir números negativos', () => {
            expect(dividir(-10, 2)).toBe(-5);
        });

        test('debe lanzar error al dividir entre cero', () => {
            expect(() => dividir(10, 0)).toThrow("No se puede dividir entre cero");
        });

        test('debe dividir cero entre un número', () => {
            expect(dividir(0, 5)).toBe(0);
        });
    });

    describe('Función ObtenerMaximo', () => {
        test('debe obtener el máximo de un array de números', () => {
            expect(obtenerMaximo([1, 5, 3, 9, 2])).toBe(9);
        });

        test('debe obtener el máximo con números negativos', () => {
            expect(obtenerMaximo([-5, -2, -10])).toBe(-2);
        });

        test('debe obtener el máximo con un solo número', () => {
            expect(obtenerMaximo([42])).toBe(42);
        });

        test('debe lanzar error con array vacío', () => {
            expect(() => obtenerMaximo([])).toThrow("El array no puede estar vacío");
        });

        test('debe obtener el máximo con decimales', () => {
            expect(obtenerMaximo([1.5, 2.7, 0.3, 5.1])).toBe(5.1);
        });
    });

    describe('Función ObtenerMinimo', () => {
        test('debe obtener el mínimo de un array de números', () => {
            expect(obtenerMinimo([1, 5, 3, 9, 2])).toBe(1);
        });

        test('debe obtener el mínimo con números negativos', () => {
            expect(obtenerMinimo([-5, -2, -10])).toBe(-10);
        });

        test('debe obtener el mínimo con un solo número', () => {
            expect(obtenerMinimo([42])).toBe(42);
        });

        test('debe lanzar error con array vacío', () => {
            expect(() => obtenerMinimo([])).toThrow("El array no puede estar vacío");
        });

        test('debe obtener el mínimo con decimales', () => {
            expect(obtenerMinimo([1.5, 2.7, 0.3, 5.1])).toBe(0.3);
        });
    });
});
