HTMLWidgets.widget({

  name: 'bpmn',

  type: 'output',

  factory: function(el, width, height) {

    // TODO: define shared variables for this instance

    return {

      renderValue: function(x) {

        // TODO: code to render the widget
        // create viewer
        var BpmnViewer = window.BpmnJS;
        var bpmnViewer = new BpmnViewer({ container: el, width: '100%', height: '100%' });


        var xml = x.bpmn_model;

        bpmnViewer.importXML(xml, function(err) {

          if (err) {
            console.log('error rendering', err);
          }

          var canvas = bpmnViewer.get('canvas'),
              overlays = bpmnViewer.get('overlays');

          // zoom to fit full viewport
          canvas.zoom('fit-viewport');

          if("overlays" in x) {

            for(var i = 0; i < x.overlays.length; i++) {
              var o = x.overlays[i];
              overlays.add(o.element, o.type, o.overlay);
            }
          }
          if("markers" in x) {

            for(var j = 0; j < x.markers.length; j++) {
              var m = x.markers[j];
              canvas.addMarker(m.element, m.className);
            }
          }



          // zoom to fit full viewport
          canvas.zoom('fit-viewport');
        });
      },

      resize: function(width, height) {

      }

    };
  }
});




