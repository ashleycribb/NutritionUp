declare namespace Framer {
    export var Info: {
        title: string;
        author: string;
        twitter: string;
        description: string;
    };
    export namespace Importer {
        function load(path: string): any;
    }
    export class DeviceView {
        setupContext(): void;
    }
    export const Device: DeviceView;
    export const Defaults: {
        DeviceView: any;
        DeviceComponent: any;
    };
}

declare const Utils: {
    delay(seconds: number, callback: () => void): void;
    isWebKit(): boolean;
    isFramerStudio(): boolean;
};

declare class Layer {
    constructor(options?: any);
    x: number;
    y: number;
    width: number;
    height: number;
    opacity: number;
    scale: number;
    visible: boolean;
    brightness: number;
    backgroundColor: string;
    superLayer: Layer;
    scrollVertical: boolean;
    scrollHorizontal: boolean;
    sendToBack(): void;
    bringToFront(): void;
    animate(options: any): void;
    onTouchStart(callback: () => void): void;
    onTouchEnd(callback: () => void): void;
}

declare class BackgroundLayer extends Layer {
    constructor(options?: any);
}

declare class ScrollComponent extends Layer {
    constructor(options?: any);
    content: Layer;
}

declare var window: Window & {
    Framer: typeof Framer;
    FramerStudioInfo: any;
    __imported__: any;
};
