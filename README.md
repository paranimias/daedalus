# Daedalus

---

Mi blog personal, basado en laplantilla Hux Blog

Varias partes de estapágina han sido vibecodeadas dado a mi falta de experiencia en javascript, el código es
público por si le es útil a alguien más que a mi

La publicación de la página se hace de forma manual dado a los problemas que se tienen con gitea-actions, por
lo que no se ha podido automatizar la publicaciónde los posts

## Escribir posts desde Obsidian

Los posts se escriben como notas normales (una por idioma) en un vault de Obsidian, y se traen al
blog con:

```sh
OBSIDIAN_BLOG_DIR=~/ruta/al/vault/Blog npm run sync:obsidian
```

El vault debe tener una carpeta `es/` y una `en/` con notas del mismo nombre para emparejarlas
(una nota que solo existe en `es/` se publica igual, sin traducción). El front matter de `es/` es
el que manda (título, fecha, tags...); de `en/` solo se lee el `title`. El script escribe en
`_posts/` el formato bilingüe que necesita el theme — esos archivos quedan marcados como
generados y no se deben editar a mano, hay que tocar la nota en el vault y volver a correr el
script. Con `npm run sync:obsidian:watch` se queda corriendo y sincroniza solo con cada cambio.

Una nota con `in-progress: true` en el front matter (o un tag `in-progress`) no se publica: se
manda a `_drafts/` (el mecanismo nativo de borradores de Jekyll), así que no aparece con
`bundle exec jekyll serve` normal, pero se puede previsualizar agregando `--drafts` si hace falta.

`npm run dev` ya incluye el watch del vault (junto con `grunt watch` y `jekyll serve`), así que
con `OBSIDIAN_BLOG_DIR` exportado en la shell, un solo comando deja todo el flujo Obsidian →
`_posts`/`_drafts` → sitio corriendo en vivo.
