#!/bin/bash

# Scripts
mkdir -p ~/.local/bin
for file in ./bin/*; do
	ln -sf "$PWD/$file" ~/.local/bin/$(basename $file)
done

# Variable de entorno
if [[ ":$PATH:" != *":$HOME/.local/bin:"* ]]; then
	echo 'export PATH="$HOME/.local/bin:$PATH"' >> ~/.bashrc
	echo "Se agregó ~/.local/bin al PATH en tu ~/.bashrc"
else
	echo "~/.local/bin ya estaba en tu PATH"
fi

# Servicios
mkdir -p ~/.config/systemd/user
for service in ./systemd/*; do
    ln -sf "$PWD/$service" ~/.config/systemd/user/$(basename "$service")
done

systemctl --user daemon-reload

# Habilitar los servicios
for service in ~/.config/systemd/user/*.service; do
    systemctl --user enable --now $(basename "$service")
done

echo "Instalacion completada"
