## 关于slide的可控选项

参考[这里](https://github.com/hakimel/reveal.js/)

### 分隔符

* -- 作为上下页分隔符
* ---作为左右页分隔符

```json
<section data-markdown
         data-separator="^---\n"
         data-vertical="^--\n">
<script typ="text/template">
__MARKDOWN__
</script>
</section>
```

### 显示格式控制

这部分的主要是控制显示的样式的，可以全有
这部分可以拿出来单独做一张用户的配置表，表里面存设置的json。

用户配置完自己的样式之后可以保存样式，下次可以自动加载样式。

```js
Reveal.initialize({

    // Display controls in the bottom right corner
    controls: true,

    // Display a presentation progress bar
    progress: true,

    // Display the page number of the current slide
    slideNumber: false,

    // Push each slide change to the browser history
    history: false,

    // Enable keyboard shortcuts for navigation
    keyboard: true,

    // Enable the slide overview mode
    overview: true,

    // Vertical centering of slides
    center: true,

    // Enables touch navigation on devices with touch input
    touch: true,

    // Loop the presentation
    loop: false,

    // Change the presentation direction to be RTL
    rtl: false,

    // Turns fragments on and off globally
    fragments: true,

    // Flags if the presentation is running in an embedded mode,
    // i.e. contained within a limited portion of the screen
    embedded: false,

    // Number of milliseconds between automatically proceeding to the
    // next slide, disabled when set to 0, this value can be overwritten
    // by using a data-autoslide attribute on your slides
    autoSlide: 0,

    // Stop auto-sliding after user input
    autoSlideStoppable: true,

    // Enable slide navigation via mouse wheel
    mouseWheel: false,

    // Hides the address bar on mobile devices
    hideAddressBar: true,

    // Opens links in an iframe preview overlay
    previewLinks: false,

    // Change the presentation direction to be RTL
    theme: 'default',
    
    // Transition style
    transition: 'default', // default/cube/page/concave/zoom/linear/fade/none

    // Transition speed
    transitionSpeed: 'default', // default/fast/slow

    // Transition style for full page slide backgrounds
    backgroundTransition: 'default', // default/none/slide/concave/convex/zoom

    // Number of slides away from the current that are visible
    viewDistance: 3,

    // Parallax background image
    parallaxBackgroundImage: '', // e.g. "'https://s3.amazonaws.com/hakim-static/reveal-js/reveal-parallax-1.jpg'"

    // Parallax background size
    parallaxBackgroundSize: '' // CSS syntax, e.g. "2100px 900px"
});
```

### dependency

关于显示ppt的默认依赖的js文件，可以默认全部加载不让用户选择

```js
Reveal.initialize({
    dependencies: [
        // Cross-browser shim that fully implements classList - https://github.com/eligrey/classList.js/
        { src: 'lib/js/classList.js', condition: function() { return !document.body.classList; } },

        // Interpret Markdown in <section> elements
        { src: 'plugin/markdown/marked.js', condition: function() { return !!document.querySelector( '[data-markdown]' ); } },
        { src: 'plugin/markdown/markdown.js', condition: function() { return !!document.querySelector( '[data-markdown]' ); } },

        // Syntax highlight for <code> elements
        { src: 'plugin/highlight/highlight.js', async: true, callback: function() { hljs.initHighlightingOnLoad(); } },

        // Zoom in and out with Alt+click
        { src: 'plugin/zoom-js/zoom.js', async: true, condition: function() { return !!document.body.classList; } },

        // Speaker notes
        { src: 'plugin/notes/notes.js', async: true, condition: function() { return !!document.body.classList; } },

        // Remote control your reveal.js presentation using a touch device
        { src: 'plugin/remotes/remotes.js', async: true, condition: function() { return !!document.body.classList; } },

        // MathJax
        { src: 'plugin/math/math.js', async: true }
    ]
});
```
