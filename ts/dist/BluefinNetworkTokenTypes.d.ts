export interface NetworkTokenBundle {
    card?: Record<string, any>;
    cardNumber?: string;
    expirationMonth?: string;
    expirationYear?: string;
    issuer?: Record<string, any>;
    metadata?: Record<string, any>;
    networkToken?: Record<string, any>;
    networkTokenBundleId?: string;
    networkTokenBundleState?: string;
    securityCode?: string;
}
export interface NetworkTokenBundleLoadMatch {
    id: string;
    $action?: string;
    [action: string]: any;
}
export interface NetworkTokenBundleCreateData {
    card?: Record<string, any>;
    cardNumber?: string;
    expirationMonth?: string;
    expirationYear?: string;
    issuer?: Record<string, any>;
    metadata?: Record<string, any>;
    networkToken?: Record<string, any>;
    networkTokenBundleId?: string;
    networkTokenBundleState?: string;
    securityCode?: string;
}
export interface NetworkTokenBundleRemoveMatch {
    id: string;
}
