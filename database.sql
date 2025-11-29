-- Base de datos para TechStore
-- Sistema de gestión de tienda de equipos informáticos

CREATE DATABASE IF NOT EXISTS Componentes_informaticos;
USE Componentes_informaticos;

-- Tabla de usuarios (clientes)
CREATE TABLE IF NOT EXISTS usuarios (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    apellidos VARCHAR(100) NOT NULL,
    dni CHAR(8) NOT NULL UNIQUE,
    telefono CHAR(9) NOT NULL,
    correo VARCHAR(150) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    direccion TEXT NOT NULL,
    estado ENUM('activo', 'inactivo') DEFAULT 'activo',
    fecha_registro TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    fecha_actualizacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    INDEX idx_dni (dni),
    INDEX idx_correo (correo),
    INDEX idx_estado (estado)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Tabla de productos
CREATE TABLE IF NOT EXISTS productos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(200) NOT NULL,
    descripcion TEXT,
    especificaciones TEXT,
    categoria ENUM('laptop', 'desktop', 'monitor', 'accesorio', 'componente') NOT NULL,
    precio DECIMAL(10, 2) NOT NULL,
    stock INT NOT NULL DEFAULT 0,
    imagen VARCHAR(500),
    fecha_registro TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    fecha_actualizacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    INDEX idx_categoria (categoria),
    INDEX idx_stock (stock)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Insertar datos de ejemplo para productos
INSERT INTO productos (nombre, descripcion, especificaciones, categoria, precio, stock, imagen) VALUES
('Laptop HP Pavilion 15', 'Laptop ideal para trabajo y estudio', 'Intel Core i5, 8GB RAM, 512GB SSD, Windows 11', 'laptop', 2499.00, 15, 'https://images.unsplash.com/photo-1588872657578-7efd1f1555ed?w=400'),
('Laptop Lenovo ThinkPad', 'Laptop profesional de alto rendimiento', 'Intel Core i7, 16GB RAM, 1TB SSD, Windows 11 Pro', 'laptop', 3799.00, 8, 'https://images.unsplash.com/photo-1496181133206-80ce9b88a853?w=400'),
('Desktop Gaming RGB', 'PC Gaming de última generación', 'AMD Ryzen 7, RTX 3060, 32GB RAM, 1TB NVMe', 'desktop', 4999.00, 5, 'https://images.unsplash.com/photo-1587202372634-32705e3bf49c?w=400'),
('Desktop Oficina Compacto', 'PC compacto ideal para oficina', 'Intel Core i3, 8GB RAM, 256GB SSD, Windows 11', 'desktop', 1599.00, 20, 'https://images.unsplash.com/photo-1593640408182-31c70c8268f5?w=400'),
('Monitor LG UltraWide 29"', 'Monitor ultrawide para multitarea', '29 pulgadas, 2560x1080, IPS, 75Hz, FreeSync', 'monitor', 899.00, 12, 'https://images.unsplash.com/photo-1527443224154-c4a3942d3acf?w=400'),
('Monitor Samsung 27" 4K', 'Monitor 4K profesional', '27 pulgadas, 3840x2160, HDR10, USB-C', 'monitor', 1299.00, 7, 'https://images.unsplash.com/photo-1527443195645-1133f7f28990?w=400'),
('Teclado Mecánico RGB', 'Teclado gaming con switches mecánicos', 'Switches Blue, Retroiluminación RGB, Anti-ghosting', 'accesorio', 199.00, 30, 'https://images.unsplash.com/photo-1595225476474-87563907a212?w=400'),
('Mouse Inalámbrico Logitech', 'Mouse ergonómico de precisión', 'Sensor óptico 4000 DPI, Batería 18 meses, Bluetooth', 'accesorio', 89.00, 45, 'https://images.unsplash.com/photo-1527864550417-7fd91fc51a46?w=400'),
('Auriculares Gaming 7.1', 'Auriculares con sonido envolvente', 'Sonido 7.1 virtual, Micrófono desmontable, RGB', 'accesorio', 149.00, 25, 'https://images.unsplash.com/photo-1618366712010-f4ae9c647dcb?w=400'),
('Webcam Full HD 1080p', 'Cámara web para videoconferencias', 'Full HD 1080p, 60fps, Enfoque automático, Micrófono dual', 'accesorio', 129.00, 18, 'https://images.unsplash.com/photo-1625239449284-20d0079c59e2?w=400'),
('SSD NVMe 1TB Kingston', 'Disco sólido de alta velocidad', '1TB, NVMe PCIe 4.0, 7000MB/s lectura', 'componente', 349.00, 40, 'https://images.unsplash.com/photo-1531492746076-161ca9bcad58?w=400'),
('RAM DDR4 16GB (2x8GB)', 'Memoria RAM de alto rendimiento', '16GB (2x8GB), DDR4 3200MHz, RGB', 'componente', 189.00, 35, 'https://images.unsplash.com/photo-1541029071515-84cc54f84dc5?w=400'),
('Tarjeta Gráfica RTX 3060', 'GPU para gaming y diseño', 'NVIDIA GeForce RTX 3060, 12GB GDDR6, Ray Tracing', 'componente', 2299.00, 6, 'https://images.unsplash.com/photo-1591488320449-011701bb6704?w=400'),
('Fuente de Poder 750W', 'PSU modular certificada', '750W, 80 Plus Gold, Modular, Ventilador silencioso', 'componente', 279.00, 22, 'https://images.unsplash.com/photo-1518770660439-4636190af475?w=400'),
('Case RGB Gaming ATX', 'Gabinete con panel de vidrio', 'ATX Mid Tower, Panel vidrio templado, 4 ventiladores RGB', 'componente', 249.00, 15, 'https://images.unsplash.com/photo-1587202372583-49330a15584d?w=400');

-- Insertar algunos usuarios de ejemplo
INSERT INTO usuarios (nombre, apellidos, dni, telefono, correo, password, direccion, estado) VALUES
('Carlos', 'Rodríguez Pérez', '12345678', '987654321', 'carlos.rodriguez@email.com', 'e10adc3949ba59abbe56e057f20f883e', 'Av. Larco 1234, Miraflores', 'activo'),
('María', 'García López', '87654321', '912345678', 'maria.garcia@email.com', 'e10adc3949ba59abbe56e057f20f883e', 'Jr. Las Begonias 567, San Isidro', 'activo'),
('Juan', 'Martínez Silva', '45678912', '998765432', 'juan.martinez@email.com', 'e10adc3949ba59abbe56e057f20f883e', 'Av. Javier Prado 890, San Borja', 'activo');

