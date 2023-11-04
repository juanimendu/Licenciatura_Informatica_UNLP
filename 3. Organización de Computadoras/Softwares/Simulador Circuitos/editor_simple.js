function LogicSimApp()
{
	this.__proto__ = new LogicSimExpr();

	this.onResizeCanvas = function(){
		//no resize
		this.centerOnCanvas();
	}	

	this.initialize = function(canvas, circuit, boolTblContainer, boolExprContainer)
	{
		// call superclass initialize
		this.setup(canvas, circuit, boolTblContainer, boolExprContainer);

		this.rebuildElements();
		
		var toolbar = new Toolbar(174);
		var grp = toolbar.addGroup("Herramientas");
		grp.addItem(new Button.Tool(images.newfile, function() {
			if (confirm("�Seguro quieres vaciar el �rea de edici�n?")) {
				this.clear();
			}
		}.bind(this) ));

		this.setDeleteBtn(
			grp.addItem(new Button.Tool(images.delete, function() {
				if (this.mode == ControlMode.deleting)
					this.setMode(ControlMode.wiring);
				else
					this.setMode(ControlMode.deleting);
		}.bind(this) )));

		grp.addItem(new Button.Tool(images.save, function() {
			Saving.save(this);
		}.bind(this) ));
		
		grp.addItem(new Button.Tool(images.open, function() {
			Saving.loadFromPrompt(this);
			this.centerOnCanvas();
		}.bind(this) ));
		
		this.setSelectBtn(
			grp.addItem(new Button.Tool(images.select, function() {
				if (this.mode == ControlMode.wiring)
					this.setMode(ControlMode.wiring);
				else
					this.setMode(ControlMode.selecting);
			}.bind(this) )));
				
		grp.addItem(new Button.Tool(images.grid, function() {
			this.setGridType( (this.getGridType()+1)%6 );
		}.bind(this) ));

		// set to false to disable dragging resize
		toolbar.setAllowResize(true);
		
		grp = toolbar.addGroup("Compuertas");
		grp.addItem(new AndGate());
		grp.addItem(new OrGate());
		grp.addItem(new XorGate());
		grp.addItem(new NotGate());
		grp.addItem(new NandGate());
		grp.addItem(new NorGate());
		grp.addItem(new XnorGate());

		grp = toolbar.addGroup("Entrada / Salida");
		grp.addItem(new ConstInput());
		grp.addItem(new OutputDisplay());
		
		
		this.setToolbar(toolbar);

		this.onResizeCanvas();

		Saving.loadFromHash(this);
		
		var popup = new PopupMenu();
		
		// function to ask for label
		var promptLbl = function (gate){
			var lbl = prompt("Escribe una Etiqueta", gate.label);
			if (lbl != null) gate.label = lbl;	
		}
	
		// function to set label layout with prompt if label is empty
		var setLbl = function(gate, display){
			if (!gate.label && display != LabelDisplay.none) {
				promptLbl(gate);
			}
			gate.displayLabel = display; 
			logicSim.changed();
		};
		
		popup.add('Editar etiqueta', function (gate) { promptLbl(gate); logicSim.changed(); }); 
		
		var menu = popup.add('Mostrar etiqueta');
		
		popup.add('Ocultar Etiquera', function(gate){ setLbl(gate, LabelDisplay.none);  }, menu );
		popup.add('A Izquierda'   , function(gate){ setLbl(gate, LabelDisplay.left);  }, menu );
		popup.add('Arriba'	  , function(gate){ setLbl(gate, LabelDisplay.top);   }, menu );
		popup.add('A Derecha'  , function(gate){ setLbl(gate, LabelDisplay.right); }, menu );
		popup.add('Abajo' , function(gate){ setLbl(gate, LabelDisplay.bottom);}, menu );
		
		this.setPopupMenu(popup);
	}
		
}

logicSim = new LogicSimApp();


function runApp(){
	logicSim.initialize('canvas', null, 'tableContainer', 'expressionContainer');
	logicSim.run();
}

window.onload = function(e){
	if (!images.allImagesLoaded()) {
		images.onAllLoaded = function(){
			runApp();
		}
	} else {
		runApp();
	}
}

