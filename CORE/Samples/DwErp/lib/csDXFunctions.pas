unit csDXFunctions;

interface

uses
  SysUtils,
  cxEditConsts, cxGridStrs, cxFilterControlStrs, cxFilterConsts,
  cxGridPopUpMenuConsts, cxClasses, dxBarStrs, cxLocalization, dxCore;

type

  { Dev Express Functions }
  TcsDXFunctions = class(TObject)
  public
    class procedure Translate_PTBR;
  end;

implementation

{ TcsDXFunctions }

class procedure TcsDXFunctions.Translate_PTBR;
begin
  //-- Editor Library
  cxSetResourceString(@cxSMenuItemCaptionCut, 'Recortar');
  cxSetResourceString(@cxSMenuItemCaptionCopy , 'Copiar');
  cxSetResourceString(@cxSMenuItemCaptionPaste, 'Colar');
  cxSetResourceString(@cxSMenuItemCaptionDelete, 'Excluir');
  cxSetResourceString(@cxSMenuItemCaptionLoad, 'Carregar...');
  cxSetResourceString(@cxSMenuItemCaptionSave, 'Salvar Como...');


  //-- ComboBox de Data
  cxSetResourceString(@cxSDatePopupClear, 'Limpar');
  cxSetResourceString(@cxSDatePopupToday, 'Hoje');

  //-- cxGrid
  cxSetResourceString(@scxGridGroupByBoxCaption, 'Agrupamento de colunas');
  cxSetResourceString(@scxGridNoDataInfoText, '<Nenhum Registro>');
  cxSetResourceString(@scxGridFilterCustomizeButtonCaption, 'Customizar...');

  //--Componente de Filtro
  cxSetResourceString(@cxSFilterFooterAddCondition, 'Adicionar nova condição');
  cxSetResourceString(@cxSFilterAddCondition, 'Adicionar condição');
  cxSetResourceString(@cxSFilterAddGroup, 'Adicionar grupo');
  cxSetResourceString(@cxSFilterRemoveRow, 'Remover condição');
  cxSetResourceString(@cxSFilterClearAll, 'Limpar filtros');
  cxSetResourceString(@cxSFilterErrorBuilding, 'Não foi possível realizar o fitro');
  cxSetResourceString(@cxSFilterGroupCaption, 'Aplicar as condições');
  cxSetResourceString(@cxSFilterControlDialogNewFile, 'semtitulo.flt');

  cxSetResourceString(@cxSFilterRootButtonCaption, 'Filtro');
  cxSetResourceString(@cxSFilterBoolOperatorAnd, 'e');
  cxSetResourceString(@cxSFilterBoolOperatorNotAnd, 'e não');
  cxSetResourceString(@cxSFilterBoolOperatorOr, 'ou');
  cxSetResourceString(@cxSFilterBoolOperatorNotOr, 'ou não');

  cxSetResourceString(@cxSFilterControlDialogActionApplyCaption, 'Aplicar');
  cxSetResourceString(@cxSFilterControlDialogActionCancelCaption, 'Cancelar');
  cxSetResourceString(@cxSFilterControlDialogActionOkCaption, 'OK');

  cxSetResourceString(@cxSFilterControlDialogActionOpenCaption, 'Abrir...');
  cxSetResourceString(@cxSFilterControlDialogActionSaveCaption, 'Salvar Como...');

  cxSetResourceString(@cxSFilterControlDialogCaption, 'Filtrar');
  cxSetResourceString(@cxSFilterControlDialogFileFilter, 'Filtros');
  cxSetResourceString(@cxSFilterControlDialogOpenDialogCaption, 'Abrir um filtro existente');
  cxSetResourceString(@cxSFilterControlDialogSaveDialogCaption, 'Salvar o filtro atual para arquivo');

  cxSetResourceString(@cxSFilterControlNullString, '<Vazio>');
  cxSetResourceString(@cxSFilterDialogCaption, 'Filtro customizado');
  cxSetResourceString(@cxSFilterDialogCharactersSeries, 'Qualquer tipo de caractér');
  cxSetResourceString(@cxSFilterDialogInvalidValue, 'Valor inválido!');

  cxSetResourceString(@cxSFilterDialogOperationAnd, 'e');
  cxSetResourceString(@cxSFilterDialogOperationOr, 'ou');

  cxSetResourceString(@cxSFilterDialogRows, 'Mostrar as colunas aqui');
  cxSetResourceString(@cxSFilterDialogSingleCharacter, 'Caractér único');
  cxSetResourceString(@cxSFilterDialogUse, 'Usar');

  cxSetResourceString(@cxSFilterAndCaption, 'e');
  cxSetResourceString(@cxSFilterBlankCaption, 'nulo');
  cxSetResourceString(@cxSFilterBoxAllCaption, 'todos');
  cxSetResourceString(@cxSFilterBoxBlanksCaption, 'nulo');
  cxSetResourceString(@cxSFilterBoxCustomCaption, 'customizar...');
  cxSetResourceString(@cxSFilterBoxNonBlanksCaption, 'não nulo');
  cxSetResourceString(@cxSFilterNotCaption, 'não');
  cxSetResourceString(@cxSFilterOperatorBeginsWith, 'iniciar com');
  cxSetResourceString(@cxSFilterOperatorBetween, 'entre');
  cxSetResourceString(@cxSFilterOperatorContains, 'contendo');
  cxSetResourceString(@cxSFilterOperatorDoesNotBeginWith, 'não começar com');
  cxSetResourceString(@cxSFilterOperatorDoesNotContain, 'não contendo');
  cxSetResourceString(@cxSFilterOperatorDoesNotEndWith, 'não terminar com');
  cxSetResourceString(@cxSFilterOperatorEndsWith, 'terminar com');
  cxSetResourceString(@cxSFilterOperatorEqual, 'igual');
  cxSetResourceString(@cxSFilterOperatorGreater, 'maior que');
  cxSetResourceString(@cxSFilterOperatorGreaterEqual, 'maior ou igual que');
  cxSetResourceString(@cxSFilterOperatorInList, 'estando em');
  cxSetResourceString(@cxSFilterOperatorIsNotNull, 'não nulo');
  cxSetResourceString(@cxSFilterOperatorIsNull, 'nulo');
  cxSetResourceString(@cxSFilterOperatorLastMonth, 'mês anterior');
  cxSetResourceString(@cxSFilterOperatorLastWeek, 'semana anterior');
  cxSetResourceString(@cxSFilterOperatorLastYear, 'ano anterior');
  cxSetResourceString(@cxSFilterOperatorLess, 'menor');
  cxSetResourceString(@cxSFilterOperatorLessEqual, 'menor ou igual');
  cxSetResourceString(@cxSFilterOperatorLike, 'contendo');
  cxSetResourceString(@cxSFilterOperatorNextMonth, 'próximo mês');
  cxSetResourceString(@cxSFilterOperatorNextWeek, 'próxima semana');
  cxSetResourceString(@cxSFilterOperatorNextYear, 'próximo ano');
  cxSetResourceString(@cxSFilterOperatorNotBetween, 'não entre');
  cxSetResourceString(@cxSFilterOperatorNotEqual, 'diferente');
  cxSetResourceString(@cxSFilterOperatorNotInList, 'não estando em');
  cxSetResourceString(@cxSFilterOperatorNotLike, 'não contendo');
  cxSetResourceString(@cxSFilterOperatorThisMonth, 'neste mês');
  cxSetResourceString(@cxSFilterOperatorThisWeek, 'nesta semana');
  cxSetResourceString(@cxSFilterOperatorThisYear, 'neste ano');
  cxSetResourceString(@cxSFilterOperatorToday, 'hoje');
  cxSetResourceString(@cxSFilterOperatorTomorrow, 'amanhã');
  cxSetResourceString(@cxSFilterOperatorYesterday, 'ontem');
  cxSetResourceString(@cxSFilterOrCaption, 'ou');


  //-- Componente Pop-up Menu
  cxSetResourceString(@cxSGridAlignCenter, 'Alinhar centralizado');
  cxSetResourceString(@cxSGridAlignLeft, 'Alinhar à esquerda');
  cxSetResourceString(@cxSGridAlignRight, 'Alinhar à direita');
  cxSetResourceString(@cxSGridAlignmentSubMenu, 'Alinhamento');
  cxSetResourceString(@cxSGridAvgMenuItem, 'Média');
  cxSetResourceString(@cxSGridBestFit, 'Tamanho automático da coluna');
  cxSetResourceString(@cxSGridBestFitAllColumns, 'Tamanho automático (Todas as colunas)');
  cxSetResourceString(@cxSGridCountMenuItem, 'Contar');
  cxSetResourceString(@cxSGridFieldChooser, 'Escolha de colunas');
  cxSetResourceString(@cxSGridGroupByBox, 'Agrupamento de colunas');
  cxSetResourceString(@cxSGridGroupByThisField, 'Agrupar por esta coluna');
  cxSetResourceString(@cxSGridMaxMenuItem, 'Máximo');
  cxSetResourceString(@cxSGridMinMenuItem, 'Mínimo');
  cxSetResourceString(@cxSGridNone, 'Nenhum');
  cxSetResourceString(@cxSGridNoneMenuItem, 'Nenhum');
  cxSetResourceString(@cxSGridRemoveColumn, 'Remover esta coluna');
  cxSetResourceString(@cxSGridShowGroupFooter, 'Rodapé agrupado');
  cxSetResourceString(@cxSGridSortColumnAsc, 'Ordenação ascendente');
  cxSetResourceString(@cxSGridSortColumnDesc, 'Ordenação descendente');
  cxSetResourceString(@cxSGridClearSorting, 'Cancelar ordenação');
  cxSetResourceString(@cxSGridSumMenuItem, 'Somar');
  cxSetResourceString(@cxSGridShowFooter, 'Rodapé');


  { -- Componente dxBAR}
  cxSetResourceString(@dxSBAR_LOOKUPDIALOGCAPTION, 'Selecione o valor');
  cxSetResourceString(@dxSBAR_LOOKUPDIALOGOK, 'OK');
  cxSetResourceString(@dxSBAR_LOOKUPDIALOGCANCEL, 'Cancelar');

  cxSetResourceString(@dxSBAR_DIALOGOK, 'OK');
  cxSetResourceString(@dxSBAR_DIALOGCANCEL, 'Cancelar');
  cxSetResourceString(@dxSBAR_COLOR_STR_0, 'Preto');
  cxSetResourceString(@dxSBAR_COLOR_STR_1, 'Marron');
  cxSetResourceString(@dxSBAR_COLOR_STR_2, 'Verde');
  cxSetResourceString(@dxSBAR_COLOR_STR_3, 'Verde Escuro');
  cxSetResourceString(@dxSBAR_COLOR_STR_4, 'Azul Petróleo');
  cxSetResourceString(@dxSBAR_COLOR_STR_5, 'Roxo');
  cxSetResourceString(@dxSBAR_COLOR_STR_6, 'Azul Marinho');
  cxSetResourceString(@dxSBAR_COLOR_STR_7, 'Cinza Escuro');
  cxSetResourceString(@dxSBAR_COLOR_STR_8, 'Cinza Claro');
  cxSetResourceString(@dxSBAR_COLOR_STR_9, 'Vermelho');
  cxSetResourceString(@dxSBAR_COLOR_STR_10, 'Verde Lima');
  cxSetResourceString(@dxSBAR_COLOR_STR_11, 'Amarelo');
  cxSetResourceString(@dxSBAR_COLOR_STR_12, 'Azul');
  cxSetResourceString(@dxSBAR_COLOR_STR_13, 'Rosa Choque');
  cxSetResourceString(@dxSBAR_COLOR_STR_14, 'Azul Água');
  cxSetResourceString(@dxSBAR_COLOR_STR_15, 'Branco');
  cxSetResourceString(@dxSBAR_COLORAUTOTEXT, '(automático)');
  cxSetResourceString(@dxSBAR_COLORCUSTOMTEXT, '(personalizado)');
  cxSetResourceString(@dxSBAR_DATETODAY, 'Hoje');
  cxSetResourceString(@dxSBAR_DATECLEAR, 'Limpar');
  cxSetResourceString(@dxSBAR_DATEDIALOGCAPTION, 'Selecione a data');
  cxSetResourceString(@dxSBAR_TREEVIEWDIALOGCAPTION, 'Selecione o item');
  cxSetResourceString(@dxSBAR_IMAGEDIALOGCAPTION, 'Selecione o item');
  cxSetResourceString(@dxSBAR_IMAGEINDEX, 'Índice da Imagem');
  cxSetResourceString(@dxSBAR_IMAGETEXT, 'Texto');
  cxSetResourceString(@dxSBAR_PLACEFORCONTROL, 'O local para ');
  cxSetResourceString(@dxSBAR_CANTASSIGNCONTROL, 'You cannot assign the same control to more than one T@dxBarControlContainerItem');
  cxSetResourceString(@dxSBAR_CXEDITVALUEDIALOGCAPTION, 'Digite o valor');

  cxSetResourceString(@dxSBAR_WANTTORESETTOOLBAR, 'Você realmente deseja resetar as mudanças feitas em ''%s'' ?');
  cxSetResourceString(@dxSBAR_WANTTORESETUSAGEDATA, 'This will delete the record of the commands you''ve used in this application and restore the default set of visible commands to the menus and toolbars. It will not undo any explicit customizations.   Are you sure you want to proceed?');
  cxSetResourceString(@dxSBAR_BARMANAGERMORETHANONE, 'A control should contain only a single TdxBarManager');
  cxSetResourceString(@dxSBAR_BARMANAGERBADOWNER, 'TdxBarManager should have TWinControl as its Owner');
  cxSetResourceString(@dxSBAR_NOBARMANAGERS, 'There are no TdxBarManagers available');
  cxSetResourceString(@dxSBAR_WANTTODELETETOOLBAR, 'Are you sure you want to delete the ''%s'' toolbar?');
  cxSetResourceString(@dxSBAR_WANTTODELETETOOLBARS, 'Are you sure you want to delete selected toolbars?');
  cxSetResourceString(@dxSBAR_WANTTODELETECATEGORY, 'Are you sure you want to delete the ''%s'' category?');
  cxSetResourceString(@dxSBAR_WANTTOCLEARCOMMANDS, 'Are you sure you want to delete all commands in the ''%s'' category?');
  cxSetResourceString(@dxSBAR_RECURSIVEMENUS, 'You cannot create recursive menus');
  cxSetResourceString(@dxSBAR_COMMANDNAMECANNOTBEBLANK, 'A command name cannot be blank. Please enter a name.');
  cxSetResourceString(@dxSBAR_TOOLBAREXISTS, 'A toolbar named ''%s'' already exists. Type another name.');
  cxSetResourceString(@dxSBAR_RECURSIVEGROUPS, 'You cannot create recursive groups');
  cxSetResourceString(@dxSBAR_WANTTODELETECOMPLEXITEM, 'One of the selected objects is an item which has several links. Are you sure you want to delete these links?');
  cxSetResourceString(@dxSBAR_CANTPLACEQUICKACCESSGROUPBUTTON, 'You can place TdxRibbonQuickAccessGroupButton only on TdxRibbonQuickAccessToolbar');
  cxSetResourceString(@dxSBAR_QUICKACCESSGROUPBUTTONTOOLBARNOTDOCKEDINRIBBON, 'Quick Access Group Button''s Toolbar is not docked in the Ribbon');
  cxSetResourceString(@dxSBAR_QUICKACCESSALREADYHASGROUPBUTTON, 'The Quick Access Toolbar already contains GroupButton with the same toolbar');
  cxSetResourceString(@dxSBAR_CANTPLACESEPARATOR, 'A separator item cannot be placed on the specified toolbar');
  cxSetResourceString(@dxSBAR_CANTPLACERIBBONGALLERY, 'You can place TdxRibbonGalleryItem only on the Ribbon');

  cxSetResourceString(@dxSBAR_CANTMERGEBARMANAGER, 'You cannot merge with the specified bar manager');
  cxSetResourceString(@dxSBAR_CANTMERGETOOLBAR, 'You cannot merge with the specified toolbar');
  cxSetResourceString(@dxSBAR_CANTMERGEWITHMERGEDTOOLBAR, 'You cannot merge a toolbar with a toolbar that is already merged');
  cxSetResourceString(@dxSBAR_CANTUNMERGETOOLBAR, 'You cannot unmerge the specified toolbar');
  cxSetResourceString(@dxSBAR_ONEOFTOOLBARSALREADYMERGED, 'One of the toolbars of the specified bar manager is already merged');
  cxSetResourceString(@dxSBAR_ONEOFTOOLBARSHASMERGEDTOOLBARS, 'One of the toolbars of the specified bar manager has merged toolbars');
  cxSetResourceString(@dxSBAR_TOOLBARHASMERGEDTOOLBARS, 'The ''%s'' toolbar has merged toolbars');
  cxSetResourceString(@dxSBAR_TOOLBARSALREADYMERGED, 'The ''%s'' toolbar is already merged with the ''%s'' toolbar');
  cxSetResourceString(@dxSBAR_TOOLBARSARENOTMERGED, 'The ''%s'' toolbar is not merged with the ''%s'' toolbar');

  cxSetResourceString(@dxSBAR_DEFAULTCATEGORYNAME, 'Default');
  cxSetResourceString(@dxSBAR_CP_RESET, '&Reset');
  cxSetResourceString(@dxSBAR_CP_DELETE, '&Delete');
  cxSetResourceString(@dxSBAR_CP_NAME, '&Name:');
  cxSetResourceString(@dxSBAR_CP_CAPTION, '&Caption:'); // is the same as dxSBAR_CP_NAME (at design time)
  cxSetResourceString(@dxSBAR_CP_BUTTONPAINTSTYLEMENU, 'Button Paint &Style');
  cxSetResourceString(@dxSBAR_CP_DEFAULTSTYLE, 'Defa&ult style');
  cxSetResourceString(@dxSBAR_CP_TEXTONLYALWAYS, '&Text Only (Always)');
  cxSetResourceString(@dxSBAR_CP_TEXTONLYINMENUS, 'Text &Only (in Menus)');
  cxSetResourceString(@dxSBAR_CP_IMAGEANDTEXT, 'Image &and Text');
  cxSetResourceString(@dxSBAR_CP_BEGINAGROUP, 'Begin a &Group');
  cxSetResourceString(@dxSBAR_CP_VISIBLE, '&Visible');
  cxSetResourceString(@dxSBAR_CP_MOSTRECENTLYUSED, '&Most recently used');

  cxSetResourceString(@dxSBAR_ADDEX, 'Add...');
  cxSetResourceString(@dxSBAR_RENAMEEX, 'Rename...');
  cxSetResourceString(@dxSBAR_DELETE, 'Delete');
  cxSetResourceString(@dxSBAR_CLEAR, 'Clear');
  cxSetResourceString(@dxSBAR_VISIBLE, 'Visible');
  cxSetResourceString(@dxSBAR_OK, 'OK');
  cxSetResourceString(@dxSBAR_CANCEL, 'Cancel');
  cxSetResourceString(@dxSBAR_SUBMENUEDITOR, 'SubMenu Editor...');
  cxSetResourceString(@dxSBAR_SUBMENUEDITORCAPTION, 'ExpressBars SubMenu Editor');
  cxSetResourceString(@dxSBAR_INSERTEX, 'Insert...');

  cxSetResourceString(@dxSBAR_MOVEUP, 'Mover Acima');
  cxSetResourceString(@dxSBAR_MOVEDOWN, 'Mover Abaixo');
  cxSetResourceString(@dxSBAR_POPUPMENUEDITOR, 'Editor de Popup...');
  cxSetResourceString(@dxSBAR_TABSHEET1, ' Barra de Tarefas ');
  cxSetResourceString(@dxSBAR_TABSHEET2, ' Comandos ');
  cxSetResourceString(@dxSBAR_TABSHEET3, ' Opções ');
  cxSetResourceString(@dxSBAR_TOOLBARS, 'Barra de Tarefas:');
  cxSetResourceString(@dxSBAR_TNEW, '&Novo...');
  cxSetResourceString(@dxSBAR_TRENAME, 'R&enomear...');
  cxSetResourceString(@dxSBAR_TDELETE, '&Deletar');
  cxSetResourceString(@dxSBAR_TRESET, '&Resetar...');
  cxSetResourceString(@dxSBAR_CLOSE, 'Fechar');
  cxSetResourceString(@dxSBAR_CAPTION, 'Personalizar');
  cxSetResourceString(@dxSBAR_CATEGORIES, 'Cate&gorias:');
  cxSetResourceString(@dxSBAR_COMMANDS, 'Coman&dos:');
  cxSetResourceString(@dxSBAR_DESCRIPTION, 'Descrição  ');

  cxSetResourceString(@dxSBAR_MDIMINIMIZE, 'Minimizar Janela');
  cxSetResourceString(@dxSBAR_MDIRESTORE, 'Restaurar Janela');
  cxSetResourceString(@dxSBAR_MDICLOSE, 'Fechar Janela');
  cxSetResourceString(@dxSBAR_CUSTOMIZE, '&Personalizar...');
  cxSetResourceString(@dxSBAR_ADDREMOVEBUTTONS, '&Adicionar ou Remover Botões');
  cxSetResourceString(@dxSBAR_MOREBUTTONS, 'Mais Botões');
  cxSetResourceString(@dxSBAR_RESETTOOLBAR, '&Resetar Barra de Tarefas');
  cxSetResourceString(@dxSBAR_EXPAND, 'Expandir (Ctrl-Down)');
  cxSetResourceString(@dxSBAR_DRAGTOMAKEMENUFLOAT, 'Arraste para fazer este Menu Flutuante');
  cxSetResourceString(@dxSBAR_MORECOMMANDS, '&Mais Comandos...');
  cxSetResourceString(@dxSBAR_SHOWBELOWRIBBON, '&Exibir Barra de Acesso Rápido Abaixo');
  cxSetResourceString(@dxSBAR_SHOWABOVERIBBON, '&Exibir Barra de Acesso Rápido Acima');
  cxSetResourceString(@dxSBAR_MINIMIZERIBBON, 'Mi&nimizar Ribbon');
  cxSetResourceString(@dxSBAR_ADDTOQAT, '&Adicionar à Barra de Acesso Rápida');
  cxSetResourceString(@dxSBAR_ADDTOQATITEMNAME, '&Adicionar %s à Barra de Acesso Rápida');
  cxSetResourceString(@dxSBAR_REMOVEFROMQAT, '&Remover da Barra de Acesso Rápida');
  cxSetResourceString(@dxSBAR_CUSTOMIZEQAT, 'Personalizar Barra de Acesso Rápida');
  cxSetResourceString(@dxSBAR_ADDGALLERYNAME, 'Galeria');
  cxSetResourceString(@dxSBAR_SHOWALLGALLERYGROUPS, 'Mostrar Todos os Grupos');
  cxSetResourceString(@dxSBAR_HIDEALLGALLERYGROUPS, 'Exibir Todos os Grupos');
  cxSetResourceString(@dxSBAR_CLEARGALLERYFILTER, 'Limpar filtro');
  cxSetResourceString(@dxSBAR_GALLERYEMPTYFILTERCAPTION, '<vazio>');

  cxSetResourceString(@dxSBAR_TOOLBARNEWNAME, 'Personalizar ');
  cxSetResourceString(@dxSBAR_CATEGORYADD, 'Adicionar Categoria');
  cxSetResourceString(@dxSBAR_CATEGORYINSERT, 'Incluir Categoria');
  cxSetResourceString(@dxSBAR_CATEGORYRENAME, 'Renomear Categoria');
  cxSetResourceString(@dxSBAR_TOOLBARADD, 'Adicionar Barra');
  cxSetResourceString(@dxSBAR_TOOLBARRENAME, 'Renomear Barra');
  cxSetResourceString(@dxSBAR_CATEGORYNAME, '&Nome Categoria:');
  cxSetResourceString(@dxSBAR_TOOLBARNAME, 'Nome &Barra:');
  cxSetResourceString(@dxSBAR_CUSTOMIZINGFORM, 'Formulário de Personalização');

  cxSetResourceString(@dxSBAR_MODIFY, '... modificar');
  cxSetResourceString(@dxSBAR_PERSMENUSANDTOOLBARS, 'Menus e Barras de Tarefas Personalizados  ');
  cxSetResourceString(@dxSBAR_MENUSSHOWRECENTITEMS, 'Me&nus show recently used commands first');
  cxSetResourceString(@dxSBAR_SHOWFULLMENUSAFTERDELAY, 'Show f&ull menus after a short delay');
  cxSetResourceString(@dxSBAR_RESETUSAGEDATA, '&Resetar meus dados de uso');

  cxSetResourceString(@dxSBAR_OTHEROPTIONS, 'Outro  ');
  cxSetResourceString(@dxSBAR_LARGEICONS, '&Icones Grandes');
  cxSetResourceString(@dxSBAR_HINTOPT1, 'Show Tool&Tips on toolbars');
  cxSetResourceString(@dxSBAR_HINTOPT2, 'Show s&hortcut keys in ToolTips');
  cxSetResourceString(@dxSBAR_MENUANIMATIONS, '&Animação do Menu:');
  cxSetResourceString(@dxSBAR_MENUANIM1, '(Nenhuma)');
  cxSetResourceString(@dxSBAR_MENUANIM2, 'Randômica');
  cxSetResourceString(@dxSBAR_MENUANIM3, 'Unfold');
  cxSetResourceString(@dxSBAR_MENUANIM4, 'Slide');
  cxSetResourceString(@dxSBAR_MENUANIM5, 'Fade');

  cxSetResourceString(@dxSBAR_CANTFINDBARMANAGERFORSTATUSBAR, 'A bar manager cannot be found for the status bar');

  cxSetResourceString(@dxSBAR_BUTTONDEFAULTACTIONDESCRIPTION, 'Press');
end;

end.

