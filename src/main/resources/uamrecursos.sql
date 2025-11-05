-- ===========================================================
-- 9. TABLA: Reporte
-- ===========================================================
CREATE TABLE Reporte (
                         id_reporte INT AUTO_INCREMENT PRIMARY KEY,
                         id_usuario INT NOT NULL,
                         id_recurso INT NOT NULL,
                         motivo TEXT NOT NULL,
                         estado ENUM('pendiente', 'atendido') DEFAULT 'pendiente',
                         fecha_reporte DATETIME DEFAULT CURRENT_TIMESTAMP,
                         FOREIGN KEY (id_usuario) REFERENCES Usuario(id_usuario)
                             ON UPDATE CASCADE ON DELETE CASCADE,
                         FOREIGN KEY (id_recurso) REFERENCES Recurso(id_recurso)
                             ON UPDATE CASCADE ON DELETE CASCADE
);
-
- ===========================================================
-- 10. TABLA: Version_Recurso
-- ===========================================================
CREATE TABLE Version_Recurso (
                                 id_version INT AUTO_INCREMENT PRIMARY KEY,
                                 id_recurso INT NOT NULL,
                                 id_usuario_modifico INT,  -- ✅ quitamos el NOT NULL
                                 fecha_modificacion DATETIME DEFAULT CURRENT_TIMESTAMP,
                                 cambios_realizados TEXT NOT NULL,
                                 motivo_cambio TEXT,
                                 FOREIGN KEY (id_recurso) REFERENCES Recurso(id_recurso)
                                     ON UPDATE CASCADE ON DELETE CASCADE,
                                 FOREIGN KEY (id_usuario_modifico) REFERENCES Usuario(id_usuario)
                                     ON UPDATE CASCADE ON DELETE SET NULL
);

-- ===========================================================
-- 11. TABLA: Accion_Admin
-- ===========================================================
CREATE TABLE Accion_Admin (
                              id_accion INT AUTO_INCREMENT PRIMARY KEY,
                              id_usuario INT NOT NULL,
                              tipo_accion ENUM('alta', 'baja', 'modificación', 'asignación_rol', 'aprobación', 'rechazo'),
                              entidad_afectada ENUM('usuario', 'materia', 'recurso', 'rol', 'tema'),
                              id_entidad_afectada INT,
                              fecha_accion DATETIME DEFAULT CURRENT_TIMESTAMP,
                              descripcion_accion TEXT,
                              motivo TEXT,
                              FOREIGN KEY (id_usuario) REFERENCES Usuario(id_usuario)
                                  ON UPDATE CASCADE ON DELETE CASCADE
);
